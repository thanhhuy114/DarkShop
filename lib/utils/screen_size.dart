// ignore_for_file: unused_local_variable

import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/no_internet/no_internet.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
const urlImage =
    'https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245';
const hosting = 'http://192.168.45.206:3000';
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
    // ignore: avoid_print
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
  if (!GlobalData.isConneted!) {
    screen = const NoInternetScreen();
  }
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

String formatCurrency(int amount) {
  final formatter = NumberFormat('#,###,###,### ₫', 'vi_VN');
  return formatter.format(amount);
}

void logOut() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey('tokten')) {
    prefs.remove('token');
  }
  GlobalData.isToken = false;
  GlobalData.isLogin = false;
  GlobalData.user = null;
}

bool checkConnet() {
  if (_connectionStatus == ConnectivityResult.none) {
    showToast('Không có kết nối mạng!');
    return false;
  }
  return true;
}

showToast(mess, {MaterialColor backgroundColor = Colors.red}) async {
  Fluttertoast.showToast(
      msg: mess,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: backgroundColor,
      textColor: Colors.white,
      fontSize: screenWidth * 0.033);
}

void connectListenner(ConnectivityResult result) {
  if (result != ConnectivityResult.none &&
      _connectionStatus == ConnectivityResult.none) {
    showToast('Đã có kết nối mạng!', backgroundColor: Colors.green);
  } else if (result == ConnectivityResult.none &&
      _connectionStatus != ConnectivityResult.none) {
    showToast('Không có kết nối mạng!');
  }
  _connectionStatus = result;

  GlobalData.isConneted = !(_connectionStatus == ConnectivityResult.none);
}
