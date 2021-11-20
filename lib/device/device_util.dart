import 'dart:io';

class DeviceUtil {
  static bool isMobile() {
    try {
      return !Platform.isMacOS && !Platform.isLinux && !Platform.isWindows;
    } catch (e) {
      return false;
    }
  }
}