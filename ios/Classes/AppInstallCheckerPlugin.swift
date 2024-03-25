import Flutter
import UIKit

public class AppInstallCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "nanakomtmt/app_install_checker", binaryMessenger: registrar.messenger())
    let instance = AppInstallCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "isAppInstalled":
      if let args = call.arguments as? [String: Any],
         let scheme = args["scheme"] as? String,
         let url = URL(string: "\(scheme)://") {
        let isInstalled = UIApplication.shared.canOpenURL(url)
        result(isInstalled)
      } else {
        result(FlutterError(code: "ERROR", message: "Invalid arguments", details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
