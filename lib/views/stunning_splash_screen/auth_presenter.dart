import 'dart:convert';
import 'dart:io';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:http/http.dart' as http;
import 'package:darkshop/utils/screen_size.dart';
import 'package:device_info/device_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPresenter {
  static AuthPresenter? _instance;
  static AuthPresenter getInstance() {
    _instance ??= AuthPresenter();
    return _instance!;
  }

  static Future<bool> isTokenAvailable() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }

  static Future<int?> getIdUserbyStore() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  Future<void> checkAuth(
      {required void Function() successful,
      required void Function() onFailure}) async {
    GlobalData.isLogin = await checkToken();

    if (GlobalData.isLogin!) {
      successful();
    } else {
      logOut();
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
    var uri = '$hosting/email-signin';

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

        // luu token
        await prefs.remove('token');
        await prefs.setString('token', data['token']);

        // luu id
        await prefs.remove('id');
        await prefs.setString('id', data['id']);
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
    var uri = '$hosting/signin';

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

        // luu token
        await prefs.remove('token');
        await prefs.setString('token', data['token']);

        // luu id
        await prefs.remove('id');
        await prefs.setString('id', data['id']);
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
    var apiUri = '$hosting/check-auth';

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
