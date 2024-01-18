import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

late double screenWidth;
late double screenHeight;

Future<AndroidDeviceInfo?> getDeviceInfo() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

      var phoneInfo = {
        'Device Model': androidInfo.model,
        'Android Version': androidInfo.version.release,
        'Device ID': androidInfo.androidId
      };

      // print(phoneInfo);

      return androidInfo;
      // IOS tính sau
      // } else if (Platform.isIOS) {
      //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      //   print('Device Model: ${iosInfo.utsname.machine}');
      //   print('Device Name: ${iosInfo.name}');
      //   print('Device ID: ${iosInfo.identifierForVendor}');
      //   print('iOS Version: ${iosInfo.systemVersion}');
    }
  } catch (e) {
    print('Error getting device info: $e');
    return null;
  }
  return null;
}

Route createRoutePushUp({required Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route createRoutePushThrough({required Widget screen}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
