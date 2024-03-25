package com.nanakomtmt.app_install_checker;

import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.PluginRegistry.Registrar;
import android.content.Context;
import android.content.pm.PackageManager;
import android.content.pm.PackageInfo;
import java.util.ArrayList;
import java.util.List;


public class AppInstallCheckerPlugin implements FlutterPlugin, MethodCallHandler {
    private MethodChannel channel;
    private Context context;

    public AppInstallCheckerPlugin() {
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
        channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "nanakomtmt/app_install_checker");
        context = flutterPluginBinding.getApplicationContext();
        channel.setMethodCallHandler(this);
    }
    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;
        context = null;
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        if (call.method.equals("isAppInstalled")) {
            Object packageNameObj = call.argument("packageName");
            if (packageNameObj instanceof String) {
                String packageName = (String) packageNameObj;
                result.success(isAppInstalled(packageName));
            } else {
                result.error("INVALID_ARGUMENT", "Argument 'packageName' is not a string", null);
            }
        } else {
            result.notImplemented();
        }
    }
    

    private boolean isAppInstalled(@NonNull String packageName) {
        try {
            
            PackageManager packageManager = context.getPackageManager();
            PackageInfo packageInfo = packageManager.getPackageInfo(packageName, 0);

            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }
}

