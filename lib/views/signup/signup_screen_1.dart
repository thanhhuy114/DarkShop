import 'package:connectivity/connectivity.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:darkshop/views/signup/sign_screen_presenter.dart';
import 'package:darkshop/views/signup/signup_screen_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpScreen1 extends StatefulWidget {
  const SignUpScreen1({super.key});

  @override
  State<SignUpScreen1> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen1> implements SignUpView {
  late final SignUpPresenter _signUpPresenter;
  String? textError;

  late final TextEditingController numberPhoneController;

  @override
  void initState() {
    super.initState();
    _signUpPresenter = SignUpPresenter(this);
    numberPhoneController = TextEditingController();
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
                Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 220,
                      height: 220,
                    )),
                SizedBox(height: screenWidth * 0.01),
                _buildWelcomeSText(context),
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

  Widget _buildPhoneInput() {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.084),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045, vertical: screenWidth * 0.0055),
      width: double.infinity,
      alignment: Alignment.center,
      // height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: Colors.white,
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 185, 88),
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w500),
        controller: numberPhoneController,
        decoration: InputDecoration(
          errorStyle: const TextStyle(),
          // errorText: widget.errorText,
          hintText: "Nhập số điện thoại của bạn",
          hintStyle: const TextStyle(
              color: Color.fromRGBO(126, 123, 118, 1),
              fontWeight: FontWeight.w500),
          prefixIcon: Container(
            width: screenWidth * 0.2,
            height: screenWidth * 0.1,
            color: const Color.fromARGB(255, 253, 253, 253),
            child: Row(children: [
              Image.asset('assets/login_screen/vietnam.jpg',
                  width: screenWidth * 0.09),
              Text(
                ' +84',
                style: TextStyle(
                    color: const Color.fromARGB(255, 245, 171, 68),
                    fontSize: screenWidth * 0.04),
              )
            ]),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        height: screenHeight * 0.15,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Bạn đã có tài khoản ? ',
            style: TextStyle(
                color: const Color.fromARGB(255, 117, 117, 117),
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      const SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              'Đăng nhập ngay bây giờ',
              style: TextStyle(
                  color: const Color.fromARGB(255, 244, 244, 244),
                  fontSize: screenWidth * 0.035,
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
          const SizedBox(height: 40),
          _buildPhoneInput(),
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
                    if (numberPhoneController.text.isNotEmpty) {
                      _signUpPresenter
                          .checkNotExistPhone(numberPhoneController.text);
                    }
                  }
                },
                child: Text('Đăng ký',
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white))),
          )
        ],
      ),
    );
  }

  Row _buildWelcomeSText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Đam mê công nghệ là bất tận',
          style:  TextStyle(
              fontSize: screenWidth * 0.052,
              color: const Color.fromARGB(255, 203, 66, 107),
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }

  @override
  displayMess(bool? result, {phoneNumber = '', mess = ''}) {
    if (result == null) {
      showToast('Số điện thoại không hợp lệ!');
    } else if (result == true) {
      showToast('Số điện thoại đã đăng ký');
    } else {
      Navigator.of(context).push(createRoutePushThrough(
          screen: SignUpScreenOTP(
        phoneNumber: phoneNumber,
      )));
    }
  }
}
