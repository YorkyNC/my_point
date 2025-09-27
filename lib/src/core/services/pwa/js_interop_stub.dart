// Stub implementation for non-web platforms

// Setup JS callbacks - no-op for non-web platforms
void setupJsCallbacks({
  required Function onInstallAvailable,
  required Function onInstallAccepted,
  required Function onInstallRejected,
  required Function onInstallUnavailable,
  required Function onInstalled,
}) {
  // Do nothing on non-web platforms
}

// Call JS to trigger installation - no-op for non-web platforms
bool callJsTriggerInstall() {
  return false;
}

// Get installation criteria - no-op for non-web platforms
Map<String, bool>? getInstallationCriteria() {
  return null;
}

// Call JS to manually show installation prompt - no-op for non-web platforms
bool callJsManuallyShowInstallPrompt() {
  return false;
}
