# App Install Checker plugin for Flutter

A Flutter plugin for checking an app is installed or not on the device.

## Getting Started

First, you need to add `app_install_checker` in your `pubspec.yaml` file:

```dart
import 'package:app_install_checker/app_install_checker.dart';
```

## Only for iOS

**For the app performing the installation check**
Add the iOS scheme in the Info.plist file:

```xml
<dict>
    ...
	<key>LSApplicationQueriesSchemes</key>
	<array>
    	<string>example</string>
	</array>
    ...
</dict>
```

**For the app being checked for installation on the device**

You don't need to install this package for the app that is checked for installation on the device; you just need to set up the custom URL scheme in the Info.plist file:

```xml
<dict>
	...
    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleURLSchemes</key>
            <array>
                <string>example</string>
            </array>
        </dict>
        ...
    </array>
</dict>
```

## Check an app is installed or not

To check an app is installed or not on the device
iosScheme is required for iOS and packageName is required for Android.

iosScheme: The scheme of the app on iOS.
packageName: The package name of the app on Android

```dart
bool isInstalled = await AppInstallChecker.isAppInstalled(iosScheme: 'example', packageName: 'com.example.app');

```
