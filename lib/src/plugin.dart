import 'package:flutter/services.dart';

class AppInstallChecker {
  static const MethodChannel _methodChannel =
      MethodChannel('nanakomtmt/app_install_checker');

  static Future<bool> isAppInstalled(String packageName) async {
    if (packageName.isEmpty) {
      throw Exception('Package name cannot be empty');
    }
    bool? isInstalled = await _methodChannel
        .invokeMethod<bool>('isAppInstalled', {'packageName': packageName});

    return isInstalled ?? false;
  }
}
