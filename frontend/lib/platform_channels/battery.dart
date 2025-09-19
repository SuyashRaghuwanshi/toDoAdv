import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Battery extends StatelessWidget {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  Future<String> getBatteryLevel() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      return 'Battery level is $result%.';
    } on PlatformException catch (e) {
      return "Failed to get battery level: '${e.message}'.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Battery Level Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String batteryLevel = await getBatteryLevel();
            print(batteryLevel);
          },
          child: Text('Get Battery Level'),
        ),
      ),
    );
  }
}
