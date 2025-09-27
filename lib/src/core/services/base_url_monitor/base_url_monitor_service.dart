import 'dart:async';

import 'package:go_router/go_router.dart';

import '../../../../main.dart';
import '../../api/client/endpoints.dart';
import '../storage/storage_service_impl.dart';

class BaseUrlMonitorService {
  static final BaseUrlMonitorService _instance =
      BaseUrlMonitorService._internal();

  factory BaseUrlMonitorService() => _instance;

  BaseUrlMonitorService._internal();

  final StorageServiceImpl _storageService = StorageServiceImpl();
  GoRouter? _router;
  bool _isHandlingChange = false; // Prevent infinite loops

  void initialize(GoRouter router) {
    _router = router;
    checkBaseUrlChange();
  }

  Future<void> checkBaseUrlChange() async {
    // Prevent concurrent executions
    if (_isHandlingChange) {
      log.d(
        'BaseUrl change handling already in progress, skipping',
      );
      return;
    }

    try {
      final String currentBaseUrl = EndPoints.baseUrl;
      final String? lastKnownBaseUrl = _storageService.getLastKnownBaseUrl();

      if (lastKnownBaseUrl != null && lastKnownBaseUrl != currentBaseUrl) {
        await _handleBaseUrlChange(currentBaseUrl);
      } else if (lastKnownBaseUrl == null) {
        await _storageService.setLastKnownBaseUrl(currentBaseUrl);
      } else {}
    } catch (e) {
      log.e(
        'Error checking baseUrl change: $e',
      );
    }
  }

  Future<void> _handleBaseUrlChange(String newBaseUrl) async {
    _isHandlingChange = true;

    try {
      final bool isLoggedIn = _storageService.isLoggedIn;

      if (isLoggedIn) {
        // Clear auth-related data when baseUrl changes
        await _storageService.deleteToken();
        await _storageService.deleteRefreshToken();
        await _storageService.setRole(null);
        await _storageService.setClassId(null);
      } else {}

      // Update the last known baseUrl
      await _storageService.setLastKnownBaseUrl(newBaseUrl);

      // Navigate to login page if user was logged in
      if (isLoggedIn) {
        if (_router != null) {
          _router!.go('/login');
        }
      }
    } catch (e) {
      log.e('Error handling baseUrl change: $e', error: e);
    } finally {
      _isHandlingChange = false;
    }
  }

  // Method to manually trigger baseUrl check (useful for development/testing)
  Future<void> forceCheckBaseUrl() async {
    await checkBaseUrlChange();
  }

  // Method to reset the handling flag (useful for testing)
  void resetState() {
    _isHandlingChange = false;
  }
}
