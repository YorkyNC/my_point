import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:google_api_availability/google_api_availability.dart';
import 'package:jwt_decode/jwt_decode.dart';
import '../../../../firebase_options.dart';
import '../../../../main.dart';
import '../../api/client/endpoints.dart';
import '../../api/client/rest/dio/dio_client.dart';
import '../injectable/injectable_service.dart';
import '../storage/storage_service_impl.dart';

class FirebaseManager {
  static bool _isInitialized = false;
  static final dio = DioRestClient();
  static final StorageServiceImpl _storageService = StorageServiceImpl();

  static Future<String?> _getCurrentFcmToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      debugPrint('Error getting FCM token: $e');
      return null;
    }
  }

  static Future<bool> _isFcmTokenChanged(String? currentToken) async {
    if (currentToken == null) return false;
    final lastSentToken = _storageService.getLastSentFcmToken();
    return currentToken != lastSentToken;
  }

  static String? _extractUserIdFromToken(String? token) {
    if (token == null) return null;
    try {
      final tokenData = Jwt.parseJwt(token);
      return tokenData['sub'];
    } catch (e) {
      debugPrint('Error extracting user ID from token: $e');
      return null;
    }
  }

  static Future<void> initialize() async {
    if (_isInitialized) return;

    try {
      await _initializeFirebase();
      await _initializePushNotifications();

      if (Platform.isAndroid) {
        try {
          await GoogleApiAvailability.instance
              .makeGooglePlayServicesAvailable();
        } catch (e) {
          debugPrint('Error checking Google Play Services: $e');
          // Continue even if Google Play Services check fails
        }
      }

      _setupTokenRefreshListener();
      _setupMessageListener();

      _isInitialized = true;
    } catch (e) {
      debugPrint('Error initializing Firebase Manager: $e');
      _isInitialized = false;
    }
  }

  static Future<void> _initializePushNotifications() async {
    try {
      await FirebaseMessaging.instance.setAutoInitEnabled(true);

      if (Platform.isIOS) {
        final settings = await FirebaseMessaging.instance.requestPermission(
          alert: true,
          badge: true,
          sound: true,
        );
        debugPrint('iOS permission status: ${settings.authorizationStatus}');
      }

      if (Platform.isAndroid) {
        await FirebaseMessaging.instance.requestPermission();
      }

      await handleToken();
    } catch (e) {
      debugPrint('Push notification initialization error: $e');
      rethrow;
    }
  }

  static Future<void> handleToken() async {
    final currentFcmToken = await _getCurrentFcmToken();
    if (currentFcmToken == null) {
      debugPrint('No FCM token available');
      return;
    }

    final tokenChanged = await _isFcmTokenChanged(currentFcmToken);
    debugPrint('Token changed: $tokenChanged');

    final clientId = _storageService.getClientId();
    try {
      bool success = false;

      if (clientId.isNotEmpty) {
        success = await _patchDevice(currentFcmToken, clientId, tokenChanged);
      }

      if (!success) {
        await _registerNewDevice(currentFcmToken);
      }
    } catch (e) {
      debugPrint('Error handling token: $e');
    }
  }

  static Future<bool> _patchDevice(
      String currentToken, String clientId, bool includeToken) async {
    try {
      final userToken = _storageService.getToken();
      final userId = _extractUserIdFromToken(userToken);
      final deviceInfo = await _getDeviceInfo();

      final Map<String, dynamic> data = {
        'userId': userId,
        'deviceInfo': {
          'additionalProp1': deviceInfo.platform,
          'additionalProp2': deviceInfo.model,
          'additionalProp3': deviceInfo.deviceId,
        },
      };

      // Only include token if it has changed
      if (includeToken) {
        data['token'] = currentToken;
      }

      final response = await dio.patch(
        '${EndPoints.baseUrl}/v1/user-device/$clientId',
        data: data,
      );

      return response.fold(
        (error) {
          return false;
        },
        (result) async {
          if (result.statusCode == 200 || result.statusCode == 201) {
            return true;
          } else {
            log.d(result.statusMessage!);
            return false;
          }
        },
      );
    } catch (e) {
      debugPrint('Error updating device: $e');
      return false;
    }
  }

  static void _setupTokenRefreshListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen(
      (fcmToken) async {
        debugPrint('FCM Token refreshed, handling token update');
        await handleToken();
      },
      onError: (err) {
        debugPrint('Error on token refresh: $err');
      },
    );
  }

  static Future<void> _registerNewDevice(String token) async {
    try {
      final dio = getIt<Dio>();
      final userToken = _storageService.getToken();
      final userId = _extractUserIdFromToken(userToken);
      final deviceInfo = await _getDeviceInfo();
      final deviceData = {
        'additionalProp1': deviceInfo.platform,
        'additionalProp2': deviceInfo.model,
        'additionalProp3': deviceInfo.deviceId,
      };

      final response = await dio.post(
        '/v1/user-device',
        data: {
          'userId': userId,
          'token': token,
          'deviceInfo': deviceData,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final newClientId = response.data['clientId'];
        if (newClientId != null) {
          await _storageService.setClientId(newClientId);
          await _storageService.setLastSentFcmToken(token);
        }
      }
    } catch (e) {
      debugPrint('Error registering device: $e');
    }
  }

  static Future<void> deactivateDeviceToken() async {
    try {
      final clientId = _storageService.getClientId();
      if (clientId.isEmpty) return;

      // Don't need current token for deactivation
      final deviceInfo = await _getDeviceInfo();
      final deviceData = {
        'additionalProp1': deviceInfo.platform,
        'additionalProp2': deviceInfo.model,
        'additionalProp3': deviceInfo.deviceId,
      };

      final dio = getIt<Dio>();
      final response = await dio.patch(
        '/v1/user-device/$clientId',
        data: {
          'userId': null,
          'deviceInfo': deviceData,
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        await _storageService.setLastSentFcmToken(null);
      }
    } catch (e) {
      debugPrint('Error in deactivateDeviceToken: $e');
    }
  }

  static Future<void> _initializeFirebase() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }
    } catch (e) {
      debugPrint('Firebase initialization error: $e');
      rethrow;
    }
  }

  static void _setupMessageListener() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint('Got a message whilst in the foreground!');
      debugPrint('Message data: ${message.data}');

      if (message.notification != null) {
        debugPrint('Message notification: ${message.notification}');
      }
    });
  }

  static Future<DeviceInfo> _getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final String platform = Platform.isIOS ? 'iOS' : 'Android';

    String model;
    String deviceId;

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.model;
      deviceId = iosInfo.identifierForVendor ?? 'unknown';
    } else {
      final androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      deviceId = androidInfo.id;
    }

    return DeviceInfo(
      platform: platform,
      model: model,
      deviceId: deviceId,
    );
  }
}

class DeviceInfo {
  final String platform;
  final String model;
  final String deviceId;

  DeviceInfo({
    required this.platform,
    required this.model,
    required this.deviceId,
  });
}
