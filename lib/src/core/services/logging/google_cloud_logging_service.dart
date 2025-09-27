import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:googleapis/logging/v2.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/token_utils.dart';
import '../storage/storage_service_impl.dart';
import 'colorized_logger_service.dart';

// Define constants for authentication and project identification
const _serviceAccountCredentials = {
  "type": "service_account",
  "project_id": "jet-join",
  "private_key_id": "14496b2f29a2d869d7bf48ba39095cf9d4c3c471",
  "private_key":
      "-----BEGIN PRIVATE KEY-----\nMIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQC81Dfr7CkwJzPx\nmz2bY8i+WSzAMFg8/0Fy+XaHl4rRrr139p72FtOW7YsIis/3ntlQUhAAEKP6tj9P\nYOiWk9E/Kljea0G3DIr/jA2zvhzNE40SF4OxMlXHUJy4fxajOT+6r3BaoPZqcAza\nZeBRiCfsthtqleU92d8TGfHH5nFpLAomib/2Mmk1H4VoXlcrUj3EsYBPm9RTU6Nt\nRMA0KF4oqm3mohluWLFysO9MD536fduwr5kBQ6OMNy3fTYucQ5SMWNWeDnCfgbSQ\n4iT2UB+1BHhwc2lXlz33ntpt9pka6WC2OuL0O+nX3xtvwZoMjlqgqFkdXiOeOD++\n2jV96vhvAgMBAAECggEAA5Gkl5pDElyV/WmzDw4ia9aWTfDxT1XTutnphO6MT8zp\nr9bCx7aZZoTe19knzRpSKSkj5vG+56zXeCdGE3J/xfMwSCPm02WH9a8uox24wEza\nTGPoDUqnlw4i/X8JbSmr1q9yLtmpTqGyMdPdxYIOnx63WJsKANKZW2xmHCJy36Cj\nwuXNtyKMtJrNHboF/F7PfD5I9KiVMHjhh6GiINGPC+9JwWmAf6Cdn8WgtAIssWnZ\nd5NgkHETmu6k5jUXt6vGWtuOfghPfLcVYG4AjfCgAtc8+8IZSpJeZlbWPpRw8VQI\nTPOLusaPjliYEUH9TjWx86f9ZbR20jZKgHSMZLSDwQKBgQD2gddtE8gTciffCG+i\nUVDQbCsmndyaA2urLrK22+k2erhSvDSZgBGM6SLIiV4dwVNq4r9DWJkhvuYd9wO+\nEMXDTFCaZ9/kLZJitBEnI7HIbDPtNV2ua3WFJ291KmXb/8l2N+zWnaHvsjbGMGKv\nOvx07Jid12Y9/HCiRR3gcIQmpwKBgQDEGcOOw39PmS71WlLLx6dY37yqGiTOEpQP\nSTcDDRUFee65vxxdQHELqAWmAk4nBnzKWBkW3g/nwmFa9e4xas3dG0My5E+T8utO\nGvJoM+y/1YILTOkls/yYbQBtygmI7xu4sDbCjuUABak2Ru/iyTvjODT9nBxwPT6D\nATwE4R+g+QKBgQC35GDK9GjbaNupnGd7FWJOOYNvSXCaTFbz2uBjXWZ6x83dmp06\nrblp/zl9lExrsh8Cq6i3Gs8Rx5FvZSibj3OYn8O5jCgP1pdPnrj1E8G6nE2Ydakv\nRubisGqLY1edaRHnaQz7hZiacb4+1zWnNz/CEgZAKcISF9IGm70QA5/yHQKBgQCc\n3qdLayRKvpWL/AdDsKE0PTalNGjA2KfMWptBO5PXX6USvcio6EYGNxDdrfZqzYvC\nKhtX6af7k8lhhF5Y9cFc4NQuv+jQx4BoaLIFnZQEGX4AIDRZztN/86JmMTrTacNZ\nSM1lcf3KuLyWCMUZPDVGHM53Ggy91KBPGAu1M4mjsQKBgQDqnmB+ZxeZrdgu8Y/R\nUsEBvWJYQnAVwDy/vJx/+oGp6BxLTPv2C7XI6VgD9oWsVSPA4eYFYmtwq89Gf/gg\ndkOqrhwU33Gv8ISYB2z5IKSmpONllaxjCJNSzKKJGQ4IE3drgIRX8wlVQKkKWfIn\nPVMvLd/NGyyKrt8mOPm2b+KeVw==\n-----END PRIVATE KEY-----\n",
  "client_email": "flutter-logger@jet-join.iam.gserviceaccount.com",
  "client_id": "101899941150182635864",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url":
      "https://www.googleapis.com/robot/v1/metadata/x509/flutter-logger%40jet-join.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
};
const _projectId = 'jet-join'; // Replace with your project ID from the JSON key file

class GoogleCloudLoggingService {
  LoggingApi? _loggingApi; // Made nullable and optional
  bool _isSetup = false; // Indicator to check if the API setup is complete
  bool _isLoggingInProgress = false; // Prevent infinite recursion
  final StorageServiceImpl _storageService = StorageServiceImpl();

  // Colorized logger for this service
  static final _colorizedLog = ColorizedLoggerService.getLogger('GoogleCloudLoggingService');

  // Method to set up the Cloud Logging API
  Future<void> setupLoggingApi() async {
    if (_isSetup) return;

    try {
      _colorizedLog.info('Setting up Google Cloud Logging API...');

      // Create credentials using ServiceAccountCredentials
      final credentials = ServiceAccountCredentials.fromJson(
        _serviceAccountCredentials,
      );

      // Authenticate using ServiceAccountCredentials and obtain an AutoRefreshingAuthClient authorized client
      final authClient = await clientViaServiceAccount(
        credentials,
        [LoggingApi.loggingWriteScope],
      );

      // Initialize the Logging API with the authorized client
      _loggingApi = LoggingApi(authClient);

      // Mark the Logging API setup as complete
      _isSetup = true;
      _colorizedLog.info('Cloud Logging API setup completed successfully for $_projectId');
      debugPrint('Cloud Logging API setup for $_projectId');
    } catch (error) {
      _colorizedLog.error('Error setting up Cloud Logging API: $error');
      debugPrint('Error setting up Cloud Logging API $error');
      // Don't throw the error, just log it and continue
      _isSetup = false;
    }
  }

  /// Generate app instance ID combining device info and app version
  /// Format: Platform-Model-AppVersion (e.g., iOS-iPhone14,5-v2.1.2)
  Future<String> _generateAppInstanceId() async {
    try {
      _colorizedLog.debug('Generating app instance ID...');

      final deviceInfo = DeviceInfoPlugin();
      final packageInfo = await PackageInfo.fromPlatform();

      String platform;
      String model;

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        platform = 'iOS';
        model = iosInfo.model.replaceAll(' ', '-').replaceAll(',', '');
      } else if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        platform = 'Android';
        model = '${androidInfo.brand}-${androidInfo.model}'.replaceAll(' ', '-').replaceAll(',', '');
      } else {
        platform = 'Unknown';
        model = 'Unknown';
      }

      final version = 'v${packageInfo.version}';
      final instanceId = '$platform-$model-$version';

      _colorizedLog.debug('Generated app instance ID: $instanceId');
      return instanceId;
    } catch (e) {
      final fallbackId = 'Unknown-Device-v0.0.0';
      _colorizedLog.warning('Error generating app instance ID: $e, using fallback: $fallbackId');
      debugPrint('Error generating app instance ID: $e');
      return fallbackId;
    }
  }

  void writeLog({required Level level, required String message}) {
    // Prevent infinite recursion by checking if logging is already in progress
    if (_isLoggingInProgress) {
      _colorizedLog.warning('Skipping cloud logging to prevent infinite recursion');
      debugPrint('Skipping cloud logging to prevent infinite recursion');
      return;
    }

    if (!_isSetup || _loggingApi == null) {
      // If Logging API is not setup, return silently
      _colorizedLog.warning('Cloud Logging API is not setup - logging locally only');
      debugPrint('Cloud Logging API is not setup - logging locally only');
      return;
    }

    // Set the flag to prevent recursion
    _isLoggingInProgress = true;

    // Execute logging asynchronously to avoid blocking the UI thread
    _writeLogAsync(level: level, message: message).whenComplete(() {
      _isLoggingInProgress = false;
    });
  }

  Future<void> _writeLogAsync({required Level level, required String message}) async {
    try {
      _colorizedLog.debug('Writing log to cloud: [${level.name}] $message');

      // Define environment and log name
      const env = 'dev';
      const logName = 'projects/$_projectId/logs/$env'; // It should in the format projects/[PROJECT_ID]/logs/[LOG_ID]

      // Create a monitored resource
      final resource = MonitoredResource()
        ..type = 'global'; // A global resource type is used for logs that are not associated with a specific resource

      // Map log levels to severity levels
      final severityFromLevel = switch (level) {
        Level.fatal => 'CRITICAL',
        Level.error => 'ERROR',
        Level.warning => 'WARNING',
        Level.info => 'INFO',
        Level.debug => 'DEBUG',
        _ => 'NOTICE',
      };

      // Get user ID from token with error handling
      String? userId;
      try {
        final token = _storageService.getToken();
        if (token != null && token.isNotEmpty) {
          userId = TokenUtils.getUserId(token);
        }
      } catch (e) {
        _colorizedLog.warning('Error getting user ID from token: $e');
        debugPrint('Error getting user ID from token: $e');
        userId = 'error_parsing_token';
      }

      // Generate app instance ID with error handling
      String appInstanceId;
      try {
        appInstanceId = await _generateAppInstanceId();
      } catch (e) {
        _colorizedLog.warning('Error generating app instance ID: $e');
        debugPrint('Error generating app instance ID: $e');
        appInstanceId = 'Unknown-Device-Error';
      }

      // Create a log entry
      final logEntry = LogEntry()
        ..logName = logName
        ..jsonPayload = {'message': message}
        ..resource = resource
        ..severity = severityFromLevel
        ..labels = {
          'project_id': _projectId, // Must match the project ID with the one in the JSON key file
          'level': level.name.toUpperCase(),
          'environment': env, // Optional but useful to filter logs by environment
          'user_id': userId ?? 'anonymous', // Extract user ID from token or use 'anonymous' as fallback
          'app_instance_id': appInstanceId, // Device info + app version (e.g., iOS-iPhone14,5-v2.1.2)
        };

      // Create a write log entries request
      final request = WriteLogEntriesRequest()..entries = [logEntry];

      // Write the log entry using the Logging API and handle errors
      await _loggingApi!.entries.write(request).catchError((error) {
        _colorizedLog.error('Error writing log entry: $error');
        debugPrint('Error writing log entry $error');
        return WriteLogEntriesResponse();
      });

      _colorizedLog.debug('Successfully wrote log to cloud');
    } catch (error) {
      // Catch all other errors to prevent app crashes
      _colorizedLog.error('Unexpected error in cloud logging: $error');
      debugPrint('Unexpected error in cloud logging: $error');
    }
  }
}
