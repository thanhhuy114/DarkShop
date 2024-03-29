import 'dart:convert';
import 'dart:io';
import 'package:darkshop/main.dart';
import 'package:http/http.dart' as http;
import 'package:darkshop/utils/screen_size.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter {
  final _hosting = 'http://192.168.65.206';

  static AuthPresenter? _instance;
  // Factory constructor để tạo hoặc trả về đối tượng đã tồn tại
  static AuthPresenter getInstance() {
    _instance ??= AuthPresenter();
    return _instance!;
  }

  static Future<bool> isTokenAvailable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  Future<void> checkAuth(
      {required void Function() successful,
      required void Function() onFailure}) async {
    MyApp.isLogin = await checkToken();

    if (MyApp.isLogin!) {
      successful();
    } else {
      onFailure();
    }
  }

  Future<bool> checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey('token')) {
      var token = prefs.getString('token') ?? 'default_value_if_not_found';
      return await checkAuthAPI(token);
    } else {
      return false;
    }
  }

  Future<bool> logInWithEmail(email) async {
    var uri = '$_hosting:3000/email-signin';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      AndroidDeviceInfo? deviceInfo = await getDeviceInfo();

      var body = {
        "email": email,
        "deviceId": deviceInfo!.androidId,
        "deviceModel": deviceInfo.model,
        "androidVersion": deviceInfo.version.release
      };
      var response = await http.post(Uri.parse(uri), body: body);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        await prefs.remove('token');
        await prefs.setString('token', data['token']);
        return true;
      } else if (response.statusCode == 201) {
        print('Login field: ${response.body}');
      } else {
        print('Error - Status Code: ${response.statusCode}');
      }
      return false;
    } catch (e) {
      print('Error - Catch: $e');
      return false;
    }
  }

  Future<bool> logIned(username, password) async {
    var uri = '$_hosting:3000/signin';

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      AndroidDeviceInfo? deviceInfo = await getDeviceInfo();

      var body = {
        "password": password,
        "username": username,
        "deviceId": deviceInfo!.androidId,
        "deviceModel": deviceInfo.model,
        "androidVersion": deviceInfo.version.release
      };
      var response = await http.post(Uri.parse(uri), body: body);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        await prefs.remove('token');
        await prefs.setString('token', data['token']);
        return true;
      } else if (response.statusCode == 201) {
        print('Login field: ${response.body}');
      } else {
        print('Error - Status Code: ${response.statusCode}');
      }
      return false;
    } catch (e) {
      print('Error - Catch: $e');
      return false;
    }
  }

  Future<bool> checkAuthAPI(token) async {
    var apiUri = '$_hosting:3000/check-auth';

    try {
      AndroidDeviceInfo? deviceInfo = await getDeviceInfo();

      var response = await http.get(Uri.parse(apiUri), headers: {
        HttpHeaders.authorizationHeader: token,
        'deviceId': deviceInfo!.androidId
      });

      if (response.statusCode == 200) {
        // print('Succes: ${response.body}');
        return true;
      } else if (response.statusCode == 201) {
        // print('Token field: ${response.body}');
        return false;
      } else {
        print('Error - Status Code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error - Catch: $e');
      return false;
    }
  }
}
