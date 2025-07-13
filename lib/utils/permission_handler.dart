// Request runtime permissions for Android 10+
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  // Request camera and storage permissions at runtime
  static Future<bool> requestCameraAndStoragePermissions() async {
    final cameraStatus = await Permission.camera.request();
    final storageStatus = await Permission.storage.request();

    return cameraStatus.isGranted && storageStatus.isGranted;
  }

  // Check if camera and storage permissions are already granted
  static Future<bool> hasCameraAndStoragePermissions() async {
    final cameraGranted = await Permission.camera.isGranted;
    final storageGranted = await Permission.storage.isGranted;

    return cameraGranted && storageGranted;
  }

  // Open app settings if permission is permanently denied
  static Future<void> openSettings() async {
    await openAppSettings();
  }
}
