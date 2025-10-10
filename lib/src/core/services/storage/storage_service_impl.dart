import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../main.dart';
import 'storage_service.dart';

class StorageServiceImpl extends ChangeNotifier implements StorageService {
  static final StorageServiceImpl _instance = StorageServiceImpl._internal();

  factory StorageServiceImpl() {
    return _instance;
  }

  StorageServiceImpl._internal();

  // Auth-related keys
  static const String _tokenKey = 'TOKEN';
  static const String _refreshTokenKey = 'REFRESH_TOKEN';
  static const String _roleKey = 'ROLE';
  static const String _classKey = 'CLASS_ID';
  static const String _languageCode = 'LANGUAGE_CODE';
  static const String _authStatusKey = 'AUTH_STATUS';
  static const String _pvzIdKey = 'PVZ_ID';

  // Device-related keys
  static const String _clientIdKey = 'CLIENT_ID';
  static const String _lastSentFcmTokenKey = 'LAST_SENT_FCM_TOKEN';
  static const String _lastKnownBaseUrlKey = 'LAST_KNOWN_BASE_URL';
  static const String _hasSeenIntroductionKey = 'HAS_SEEN_INTRODUCTION';

  late Box authBox;
  late Box deviceBox;

  String? _cachedLastSentFcmToken;

  // Device-related methods

  Future<void> setLastSentFcmToken(String? token) async {
    try {
      _cachedLastSentFcmToken = token;
      await deviceBox.put(_lastSentFcmTokenKey, token);
      debugPrint('Last sent FCM token saved successfully: $token');
    } catch (e) {
      debugPrint('Error saving last sent FCM token: $e');
      rethrow;
    }
  }

  String? getLastSentFcmToken() {
    try {
      if (_cachedLastSentFcmToken != null) return _cachedLastSentFcmToken;
      _cachedLastSentFcmToken = deviceBox.get(_lastSentFcmTokenKey);
      debugPrint('Retrieved last sent FCM token: $_cachedLastSentFcmToken');
      return _cachedLastSentFcmToken;
    } catch (e) {
      debugPrint('Error getting last sent FCM token: $e');
      return null;
    }
  }

  @override
  Future<void> setClientId(String clientId) async {
    try {
      await deviceBox.put(_clientIdKey, clientId);
      debugPrint('Client ID saved successfully: $clientId');
    } catch (e) {
      debugPrint('Error saving client ID: $e');
      rethrow;
    }
  }

  @override
  String getClientId() {
    try {
      final clientId = deviceBox.get(_clientIdKey);
      debugPrint('Retrieved client ID: $clientId');
      return clientId ?? '';
    } catch (e) {
      debugPrint('Error getting client ID: $e');
      return '';
    }
  }

  // Auth-related methods
  @override
  Future<void> setToken(String? token) async {
    log.d('$token TOKEN');
    await authBox.put(_tokenKey, token);
    notifyListeners();
  }

  @override
  Future<void> setRole(String? role) async {
    log.d('Role saved: $role');
    await authBox.put(_roleKey, role);
    notifyListeners();
  }

  @override
  String? getClassId() {
    return authBox.get(_classKey);
  }

  void notify() {
    notifyListeners();
  }

  @override
  Future<void> setClassId(String? classId) async {
    log.d('$classId CLASS');
    await authBox.put(_classKey, classId);
    notifyListeners();
  }

  @override
  Future<void> setRefreshToken(String? refreshToken) async {
    log.d('$refreshToken REFRESH_TOKEN');
    await authBox.put(_refreshTokenKey, refreshToken);
    notifyListeners();
  }

  Future<void> setLanguageCode(String languageCode) async {
    await authBox.put(_languageCode, languageCode);
  }

  @override
  String? getToken() {
    try {
      final token = authBox.get(_tokenKey);
      log.d('StorageService: Retrieved token: ${token?.substring(0, token.length > 20 ? 20 : token.length)}...');
      return token;
    } catch (e) {
      log.w('StorageService: Error retrieving token, authBox not initialized: $e');
      return null;
    }
  }

  @override
  String? getRole() {
    return authBox.get(_roleKey);
  }

  // PVZ ID methods
  @override
  Future<void> setPvzId(String? pvzId) async {
    log.d('PVZ ID saved: $pvzId');
    await authBox.put(_pvzIdKey, pvzId);
    notifyListeners();
  }

  @override
  String? getPvzId() {
    return authBox.get(_pvzIdKey);
  }

  @override
  Future<void> deletePvzId() async {
    await authBox.delete(_pvzIdKey);
    notifyListeners();
  }

  // Extract and save PVZ ID from JWT token
  Future<void> extractAndSavePvzIdFromToken(String token) async {
    try {
      final parts = token.split('.');
      if (parts.length == 3) {
        final payload = parts[1];
        final padded = payload.padRight(payload.length + (4 - payload.length % 4) % 4, '=');
        final decoded = utf8.decode(base64Url.decode(padded));
        final payloadJson = jsonDecode(decoded);
        final pvzIdValue = payloadJson['pvzId'];

        if (pvzIdValue != null) {
          final pvzId = pvzIdValue.toString();
          log.d('🔍 Extracted PVZ ID from token: $pvzId (type: ${pvzIdValue.runtimeType})');
          await setPvzId(pvzId);
        } else {
          log.d('🔍 No PVZ ID found in token');
        }
      }
    } catch (e) {
      log.d('🔍 Error extracting PVZ ID from token: $e');
    }
  }

  @override
  Future<void> deleteRole() async {
    log.d('StorageService: Deleting role from storage');
    await authBox.delete(_roleKey);
    log.d('StorageService: Role deleted, notifying listeners');
    notifyListeners();
  }

  @override
  String? getRefreshToken() {
    return authBox.get(_refreshTokenKey);
  }

  @override
  Future<void> deleteToken() async {
    log.d('StorageService: Deleting token from storage');
    await authBox.delete(_tokenKey);
    log.d('StorageService: Token deleted, notifying listeners');
    notifyListeners();
  }

  @override
  Future<void> deleteRefreshToken() async {
    await authBox.delete(_refreshTokenKey);
    notifyListeners();
  }

  Future<String?> getLanguageCode() async {
    return await authBox.get(_languageCode);
  }

  // AuthStatus methods
  Future<void> setAuthStatus(String? authStatus) async {
    log.d('Auth status saved: $authStatus');
    await authBox.put(_authStatusKey, authStatus);
    notifyListeners();
  }

  String? getAuthStatus() {
    try {
      final authStatus = authBox.get(_authStatusKey);
      log.d('Retrieved auth status: $authStatus');
      return authStatus;
    } catch (e) {
      log.w('Error retrieving auth status: $e');
      return null;
    }
  }

  Future<void> deleteAuthStatus() async {
    log.d('Deleting auth status from storage');
    await authBox.delete(_authStatusKey);
    notifyListeners();
  }

  // Clear methods
  Future<void> clearAuth() async {
    if (authBox.isOpen) {
      await authBox.clear();
      notifyListeners();
    }
  }

  // Clear only device data
  Future<void> clearDeviceData() async {
    if (deviceBox.isOpen) {
      _cachedLastSentFcmToken = null;
      await deviceBox.clear();
    }
  }

  // Interface compatibility method - only clears auth data
  @override
  Future<void> clear() async {
    if (authBox.isOpen) {
      await authBox.clear();
      notifyListeners();
    }
  }

  // Clear all data
  Future<void> clearAll() async {
    await clearAuth();
    await clearDeviceData();
  }

  // Initialization methods
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    authBox = await Hive.openBox('auth');
    deviceBox = await Hive.openBox('device');
    _initializeCachedValues();
  }

  @override
  Future<void> openBox() async {
    authBox = await Hive.openBox('auth');
    deviceBox = await Hive.openBox('device');
    _initializeCachedValues();
  }

  void _initializeCachedValues() {
    _cachedLastSentFcmToken = deviceBox.get(_lastSentFcmTokenKey);
  }

  @override
  bool checkLoggedIn() {
    return getToken() != null;
  }

  @override
  bool get isLoggedIn => checkLoggedIn();

  // BaseUrl monitoring methods
  @override
  Future<void> setLastKnownBaseUrl(String baseUrl) async {
    try {
      await deviceBox.put(_lastKnownBaseUrlKey, baseUrl);
      debugPrint('Last known baseUrl saved: $baseUrl');
    } catch (e) {
      debugPrint('Error saving last known baseUrl: $e');
      rethrow;
    }
  }

  @override
  String? getLastKnownBaseUrl() {
    try {
      final baseUrl = deviceBox.get(_lastKnownBaseUrlKey);

      return baseUrl;
    } catch (e) {
      return null;
    }
  }

  // Introduction tracking methods
  @override
  Future<void> setHasSeenIntroduction(bool hasSeen) async {
    try {
      await deviceBox.put(_hasSeenIntroductionKey, hasSeen);
      debugPrint('Introduction seen status saved: $hasSeen');
    } catch (e) {
      debugPrint('Error saving introduction seen status: $e');
      rethrow;
    }
  }

  @override
  bool hasSeenIntroduction() {
    try {
      final hasSeen = deviceBox.get(_hasSeenIntroductionKey, defaultValue: false);
      debugPrint('Retrieved introduction seen status: $hasSeen');
      return hasSeen;
    } catch (e) {
      debugPrint('Error getting introduction seen status: $e');
      return false;
    }
  }

  // Method to reset introduction status (useful for testing)
  @override
  Future<void> resetIntroductionStatus() async {
    try {
      await deviceBox.delete(_hasSeenIntroductionKey);
      debugPrint('Introduction status reset');
    } catch (e) {
      debugPrint('Error resetting introduction status: $e');
      rethrow;
    }
  }
}
