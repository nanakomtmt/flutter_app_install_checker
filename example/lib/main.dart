import 'package:flutter/material.dart';
import 'package:app_install_checker/app_install_checker.dart';

void main() => runApp(const MaterialApp(home: ExampleApp()));

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('App Install Checker Demo')),
      body: const Center(
        child: CheckAppInstalledWidget(),
      ),
    );
  }
}

class CheckAppInstalledWidget extends StatefulWidget {
  const CheckAppInstalledWidget({super.key});

  @override
  State<CheckAppInstalledWidget> createState() =>
      _CheckAppInstalledWidgetState();
}

class _CheckAppInstalledWidgetState extends State<CheckAppInstalledWidget> {
  String _appStatus = '';

  Future<void> _checkAppInstalled(String iosScheme, String packageName) async {
    final bool isInstalled =
        await AppInstallChecker.isAppInstalled(iosScheme, packageName);
    setState(() {
      _appStatus = isInstalled ? "App is installed." : "App is not installed.";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: () => _checkAppInstalled("http", "com.android.chrome"),
          child: const Text('Check App Installed'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(_appStatus),
        ),
      ],
    );
  }
}
