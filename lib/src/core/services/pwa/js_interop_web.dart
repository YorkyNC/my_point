@pragma('dart2js:as-javascript')
library;

// A simplified version for web platforms
class JsInteropWeb {
  // Setup JS callbacks for web platform
  static void setupJsCallbacks({
    required Function onInstallAvailable,
    required Function onInstallAccepted,
    required Function onInstallRejected,
    required Function onInstallUnavailable,
    required Function onInstalled,
  }) {
    // This is a simplified version that will be implemented with JS interop
    // when it's compiled to JavaScript for web
  }

  // Call JS to trigger installation
  static bool callJsTriggerInstall() {
    // Web implementation
    return false;
  }

  // Get installation criteria from JS
  static Map<String, bool>? getInstallationCriteria() {
    // Web implementation
    return {
      'https': false,
      'serviceWorker': false,
      'manifest': false,
      'installed': false,
    };
  }

  // Call JS to manually show installation prompt
  static bool callJsManuallyShowInstallPrompt() {
    // Web implementation
    return false;
  }
}

// Export the web implementation
void setupJsCallbacks({
  required Function onInstallAvailable,
  required Function onInstallAccepted,
  required Function onInstallRejected,
  required Function onInstallUnavailable,
  required Function onInstalled,
}) {
  JsInteropWeb.setupJsCallbacks(
    onInstallAvailable: onInstallAvailable,
    onInstallAccepted: onInstallAccepted,
    onInstallRejected: onInstallRejected,
    onInstallUnavailable: onInstallUnavailable,
    onInstalled: onInstalled,
  );
}

bool callJsTriggerInstall() {
  return JsInteropWeb.callJsTriggerInstall();
}

Map<String, bool>? getInstallationCriteria() {
  return JsInteropWeb.getInstallationCriteria();
}

bool callJsManuallyShowInstallPrompt() {
  return JsInteropWeb.callJsManuallyShowInstallPrompt();
}
