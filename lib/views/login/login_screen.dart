import 'package:connectivity/connectivity.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/signup/signup_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'components/password_textfield.dart';
import 'components/username_textfield.dart';
import 'login_presenter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LogInPresenter _logInPresenter = LogInPresenter();
  String? usernameError;
  String? passwordError;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Connectivity().onConnectivityChanged.listen(connectListenner);
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      dismissOnCapturedTaps: true,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  size: screenWidth * 0.075,
                  Icons.arrow_back,
                  color: Colors.black,
                ))),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Form(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                SizedBox(height: screenWidth * 0.01),
                _buildWelcomeSText(context),
                KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                  return Visibility(
                      visible: !isKeyboardVisible,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Image.asset(
                            'assets/logo.png',
                            width: 120,
                            height: 120,
                          )));
                }),
                _buildFormLogin(),
                KeyboardVisibilityBuilder(
                    builder: (context, isKeyboardVisible) {
                  return Visibility(
                      visible: !isKeyboardVisible,
                      child: _buildAdditionalInfo());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        height: screenHeight * 0.06,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hoặc ',
            style: TextStyle(
                color: const Color.fromARGB(255, 117, 117, 117),
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Đăng nhập bằng ',
            style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
              style: ButtonStyle(
                  minimumSize: const MaterialStatePropertyAll(Size(60, 0)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                _logInPresenter.signInWithGoogle(context);
              },
              child: Image.asset(
                'assets/login_screen/logo_google.png',
                width: screenWidth * 0.125,
                height: screenWidth * 0.075,
              ))
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bạn chưa có tài khoản? ',
            style: TextStyle(
                color: const Color.fromARGB(255, 117, 117, 117),
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () =>   Navigator.of(context)
                .push(createRoutePushThrough(screen: const SignUpScreen1())),
            child: Text(
              'Đăng ký ',
              style: TextStyle(
                  color: const Color.fromARGB(255, 253, 253, 253),
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      SizedBox(height: screenWidth * 0.06)
    ]);
  }

  Padding _buildFormLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          UsernameTextfield(
            controller: usernameController,
            errorText: usernameError,
          ),
          SizedBox(height: screenWidth * 0.041),
          PasswordTextField(
            controller: passwordController,
            errorText: passwordError,
          ),
          SizedBox(height: screenWidth * 0.041),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23))),
                    minimumSize: MaterialStatePropertyAll(
                        Size(double.infinity, screenWidth * 0.144)),
                    backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 203, 66, 107))),
                onPressed: () {
                  if (checkConnet()) {
                    if (_logInPresenter.checkLoginCredentials(
                        usernameController.text, passwordController.text,
                        (errorUsername, errorPassword) {
                      setState(() {
                        usernameError = errorUsername;
                        passwordError = errorPassword;
                      });
                    })) {
                      _logInPresenter.checkLoginValid(usernameController.text,
                          passwordController.text, context);
                    }
                  }
                },
                child: Text('Đăng nhập',
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white))),
          ),
          SizedBox(height: screenHeight * 0.02),
          GestureDetector(
            onTap: () {
                showToast('Vui lòng liên hệ quản trị viên để được hỗ trợ\nSDT: 0944221401\nMail: huycherry14@gmail.com\nCảm ơn', backgroundColor: Colors.green);
            },
            child: Text(
              'Quên mật khẩu?',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: screenWidth * 0.033),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildWelcomeSText(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Xin chào!',
                style: Theme.of(context).textTheme.customHeadlineLarge1,
              ),
              Text('Chào mừng bạn đến với DarkShop',
                  style: Theme.of(context).textTheme.customHeadlineLarge2)
            ],
          ),
        )
      ],
    );
  }
}

extension CustomTextStyles on TextTheme {
  TextStyle get customHeadlineLarge2 {
    return headlineLarge!.copyWith(
        fontSize: screenWidth * 0.041,
        color: const Color.fromARGB(255, 203, 66, 107),
        fontWeight: FontWeight.w700);
  }
   TextStyle get customHeadlineLarge1 {
    return headlineLarge!.copyWith(
        fontSize: screenWidth * 0.062,
        color: const Color.fromARGB(255, 203, 66, 107),
        fontWeight: FontWeight.w800);
  }
}


