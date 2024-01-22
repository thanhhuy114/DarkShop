import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/signup/sign_screen_presenter.dart';
import 'package:darkshop/views/signup/signup_screen_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpScreen2 extends StatefulWidget {
  const SignUpScreen2({super.key, required this.phoneNumber});
  final String phoneNumber;

  @override
  State<SignUpScreen2> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen2> implements SignUpView {
  late final SignUpPresenter _signUpPresenter;
  String? textError;
  bool _isHidePass = true;

  late final TextEditingController _emailController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    _signUpPresenter = SignUpPresenter(this);
    _fullNameController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    Connectivity().onConnectivityChanged.listen(connectListenner);
    super.initState();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismissOnTap(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            elevation: 0,
            title: Row(children: [
              SizedBox(width: screenWidth * 0.08),
              Text('Điền thông tin',
                  style: TextStyle(
                      fontSize: screenWidth * 0.062,
                      color: const Color.fromARGB(255, 203, 66, 107),
                      fontWeight: FontWeight.w800))
            ]),
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

  Widget _buildPhoneInput(
      {required String text,
      required TextEditingController controller,
      bool? isPassword}) {
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
        obscureText: isPassword ?? false,
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 185, 88),
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w500),
        controller: controller,
        decoration: InputDecoration(
          suffix: isPassword == null
              ? null
              : GestureDetector(
                  onTap: () {
                    setState(() => _isHidePass = !_isHidePass);
                  },
                  child: Icon(
                    _isHidePass ? Icons.visibility_off : Icons.visibility,
                    size: screenWidth * 0.055,
                    color: const Color.fromARGB(255, 204, 148, 71),
                  ),
                ),
          errorStyle: const TextStyle(),
          hintText: text,
          hintStyle: const TextStyle(
              color: Color.fromRGBO(126, 123, 118, 1),
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(
        height: screenHeight * 0.05,
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
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            },
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
      padding: EdgeInsets.only(top: screenHeight * 0.1),
      child: Column(
        children: [
          _buildPhoneInput(text: 'Nhập Email', controller: _emailController),
          Text(
            'Bạn cũng có thể dùng Email để đăng nhập\nLưu ý: Số điện thoại và Email là không thể thay đổi!!\n',
            style: TextStyle(
                color: const Color.fromARGB(255, 103, 99, 99),
                fontSize: screenWidth * 0.032),
          ),
          _buildPhoneInput(text: 'Họ Tên', controller: _fullNameController),
          SizedBox(height: screenWidth * 0.041),
          _buildPhoneInput(
              text: 'Mật Khẩu',
              controller: _passwordController,
              isPassword: _isHidePass),
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
                    if (_fullNameController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _emailController.text.isEmpty) {
                      displayMess(false, mess: 'Vui lòng nhập đầy đủ');
                    } else {
                      User user = User(
                          id: 0,
                          isAdmin: false,
                          fullname: _fullNameController.text,
                          image: null,
                          phone: widget.phoneNumber,
                          email: _emailController.text,
                          recentAddress: 'null',
                          blocked: false);

                      _signUpPresenter.addUser(user, _passwordController.text);
                    }
                  }
                },
                child: Text('Đăng ký',
                    style: TextStyle(
                        fontSize: screenWidth * 0.05, color: Colors.white))),
          ),
        ],
      ),
    );
  }

  @override
  displayMess(bool? result, {phoneNumber = '', mess = ''}) {
    if (result == null) {
      showToast('Số điện thoại không hợp lệ!');
    } else if (result == false) {
      showToast(mess);
    } else {
      showToast(mess, backgroundColor: Colors.green);
      showToast('Chuyến hướng về trang đăng nhập',
          backgroundColor: Colors.green);
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      });
    }
  }
}

extension CustomTextStyles on TextTheme {
  TextStyle get customHeadlineLarge2 {
    return headlineLarge!.copyWith(
        fontSize: screenWidth * 0.041,
        color: const Color.fromARGB(255, 203, 66, 107),
        fontWeight: FontWeight.w700);
  }
}
