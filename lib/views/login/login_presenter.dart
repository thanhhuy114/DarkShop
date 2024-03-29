import 'package:connectivity/connectivity.dart';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/stunning_splash_screen/auth_presenter.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LogInPresenter {
  ConnectivityResult _connectionStatus = ConnectivityResult.wifi;
  final AuthPresenter _authPresenter = AuthPresenter();

  bool checkLoginCredentials(String username, String password,
      Function(String? errorUsername, String? errorPassword) callback) {
    String? errorUsername;
    String? errorPassword;

    if (username.trim().isEmpty) errorUsername = 'Không được bỏ trống!';
    if (password.trim().isEmpty) errorPassword = 'Không được bỏ trống!';

    callback(errorUsername, errorPassword);

    Future.delayed(const Duration(seconds: 3), () {
      callback(null, null);
    });

    if (errorPassword == null && errorUsername == null) return true;
    return false;
  }

  void connectListenner(ConnectivityResult result) {
    if (result != ConnectivityResult.none &&
        _connectionStatus == ConnectivityResult.none) {
      _showToast('Đã có kết nối mạng!', backgroundColor: Colors.green);
    } else if (result == ConnectivityResult.none &&
        _connectionStatus != ConnectivityResult.none) {
      _showToast('Không có kết nối mạng!');
    }
    _connectionStatus = result;
  }

  bool checkConnet() {
    if (_connectionStatus == ConnectivityResult.none) {
      _showToast('Không có kết nối mạng!');
      return false;
    }
    return true;
  }

  void checkLoginValid(username, password, context) async {
    _showLoadingDialog(context);
    late bool result;
    await Future.wait([
      () async {
        result = await _authPresenter.logIned(username.trim(), password.trim());
      }(),
      Future.delayed(const Duration(seconds: 3))
    ]);
    _hideLoadingDialog(context);

    if (result) {
       MyApp.isLogin = true;
      _navigationToHomeScreen(context);
    } else {
      _showToast('Đăng nhập không thành công!');
    }
  }

  _navigationToHomeScreen(context) {
    Navigator.pop(context);
  }

  signInWithGoogle(context) async {
    try {
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      var email = googleUser!.email;

      if (await _authPresenter.logInWithEmail(email)) {
        MyApp.isLogin = true;
        _navigationToHomeScreen(context);
      } else {
        _showToast('Đăng nhập không thành công!');
      }

      googleUser = await GoogleSignIn().disconnect();
    } catch (error) {
      _showToast('Lỗi đăng nhập bằng Google');
    }
  }

  void _showLoadingDialog(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: const [
              CircularProgressIndicator(),
              SizedBox(width: 20),
              Text("Đăng nhập..."),
            ],
          ),
        );
      },
    );
  }

  void _hideLoadingDialog(context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  _showToast(mess, {MaterialColor backgroundColor = Colors.red}) async {
    Fluttertoast.showToast(
        msg: mess,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 2,
        backgroundColor: backgroundColor,
        textColor: Colors.white,
        fontSize: screenWidth * 0.033);
  }
}
