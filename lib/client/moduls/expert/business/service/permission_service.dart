import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  static Future<Map<Permission, PermissionStatus>> checkPermissions() async {
    List<Permission> permissions = [
      Permission.camera,
      Permission.microphone,
    ];

    Map<Permission, PermissionStatus> statuses = await permissions.request();

    return statuses;
  }

  static Future<bool> verifyPermissions() async {
    Map<Permission, PermissionStatus> currentStatus = {};
    List<Permission> permissions = [
      Permission.camera,
      Permission.microphone,
    ];

    for (Permission permission in permissions) {
      final status = await permission.status;
      currentStatus[permission] = status;
    }
    return currentStatus.values
        .every((status) => status == PermissionStatus.granted);
  }
}
