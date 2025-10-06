import 'package:camera/camera.dart';

class PermissionService {
  static Future<bool> checkCameraPermission() async {
    try {
      final cameras = await availableCameras();
      return cameras.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> requestCameraPermission() async {
    try {
      final cameras = await availableCameras();
      return cameras.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  static void openAppSettings() {
    // This would need to be implemented using platform channels
    // For now, we'll just show a message to the user
  }
}
