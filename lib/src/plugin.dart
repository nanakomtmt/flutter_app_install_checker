import 'dart:io';

import 'package:flutter/services.dart';

class AppInstallChecker {
  static const MethodChannel _methodChannel =
      MethodChannel('nanakomtmt/app_install_checker');

  static Future<bool> isAppInstalled(
      String? scheme, String? packageName) async {
    try {
      var arg =
          Platform.isIOS ? {'scheme': scheme} : {'packageName': packageName};
      bool isInstalled =
          await _methodChannel.invokeMethod<bool>('isAppInstalled', arg) ??
              false;
      return isInstalled;
    } catch (e) {
      rethrow;
    }
  }
}
