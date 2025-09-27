import 'dart:async';

// Conditionally import dart:js
import 'package:flutter/foundation.dart';
import '../../../../main.dart';

// Different imports for web vs non-web
import 'js_interop_stub.dart' if (dart.library.js) 'js_interop_web.dart';

/// A service that provides JavaScript interop for PWA installation
class JsInteropService {
  // Singleton pattern
  static final JsInteropService _instance = JsInteropService._internal();
  factory JsInteropService() => _instance;
  JsInteropService._internal();

  // Stream controllers to handle installation events
  final StreamController<void> _installAvailableController =
      StreamController<void>.broadcast();
  final StreamController<bool> _installResultController =
      StreamController<bool>.broadcast();
  final StreamController<void> _installedController =
      StreamController<void>.broadcast();

  // Streams that can be listened to by Flutter widgets
  Stream<void> get onInstallAvailable => _installAvailableController.stream;
  Stream<bool> get onInstallResult => _installResultController.stream;
  Stream<void> get onInstalled => _installedController.stream;

  // Indicates if installation is available
  bool _isInstallAvailable = false;
  bool get isInstallAvailable => _isInstallAvailable;

  /// Initialize the service
  void initialize() {
    if (!kIsWeb) return;

    // Set up listeners for our JavaScript callbacks
    _setupJsCallbacks();
  }

  /// Set up JavaScript callbacks
  void _setupJsCallbacks() {
    if (!kIsWeb) return;

    // Use the JsInteropHelper
    setupJsCallbacks(
      onInstallAvailable: () {
        log.i('JS->Dart: Install available');
        _isInstallAvailable = true;
        _installAvailableController.add(null);
      },
      onInstallAccepted: () {
        log.i('JS->Dart: Install accepted');
        _installResultController.add(true);
      },
      onInstallRejected: () {
        log.i('JS->Dart: Install rejected');
        _installResultController.add(false);
      },
      onInstallUnavailable: () {
        log.i('JS->Dart: Install unavailable');
        _isInstallAvailable = false;
        _installResultController.add(false);
      },
      onInstalled: () {
        log.i('JS->Dart: App installed');
        _installedController.add(null);
      },
    );
  }

  /// Trigger the PWA installation prompt
  Future<bool> triggerInstall() async {
    if (!kIsWeb) return false;

    log.i('Dart->JS: Triggering install prompt');

    final success = callJsTriggerInstall();
    if (!success) {
      log.e('triggerPwaInstall function not found in JS context');
      return false;
    }

    // Create a completer to wait for the result
    final completer = Completer<bool>();

    // Listen for the result
    final subscription = _installResultController.stream.listen((result) {
      if (!completer.isCompleted) {
        completer.complete(result);
      }
    });

    // Add a timeout
    Timer(const Duration(seconds: 10), () {
      if (!completer.isCompleted) {
        log.w('Install prompt timed out');
        completer.complete(false);
      }
    });

    // Wait for the result
    final result = await completer.future;
    subscription.cancel();
    return result;
  }

  /// Check if the PWA can be installed
  bool canInstallPwa() {
    if (!kIsWeb) return false;
    return _isInstallAvailable;
  }

  /// Check PWA installation criteria
  Map<String, bool>? checkInstallationCriteria() {
    if (!kIsWeb) return null;
    return getInstallationCriteria();
  }

  /// Manually try to show the install prompt (for testing)
  bool manuallyShowInstallPrompt() {
    if (!kIsWeb) return false;
    return callJsManuallyShowInstallPrompt();
  }

  /// Dispose the service
  void dispose() {
    _installAvailableController.close();
    _installResultController.close();
    _installedController.close();
  }
}
