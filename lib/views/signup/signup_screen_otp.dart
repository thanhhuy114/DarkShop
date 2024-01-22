import 'package:connectivity/connectivity.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:darkshop/views/signup/sign_screen_presenter.dart';
import 'package:darkshop/views/signup/signup_screen_2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SignUpScreenOTP extends StatefulWidget {
  const SignUpScreenOTP({super.key, required this.phoneNumber});
  final String phoneNumber;
  @override
  State<SignUpScreenOTP> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreenOTP> implements SignUpView {
  String? textError;
  String verificationId = '';
  late final TextEditingController numberPhoneController;

  @override
  void initState() {
    super.initState();

    numberPhoneController = TextEditingController();
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+84${widget.phoneNumber.substring(1)}',
      verificationCompleted: (PhoneAuthCredential credential) {
        if (credential.smsCode != null) {
          numberPhoneController.text = credential.smsCode!;
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'too-many-requests') {
          displayMess(false, mess: 'Số này đã gửi nhiều lần, hãy thử lại sau!');
        } else {
          displayMess(false, mess: 'Lỗi gửi OTP');
        }
      },
      timeout: const Duration(seconds: 60),
      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        displayMess(true, mess: 'Đã gửi OTP có hiệu lực 60s');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        displayMess(false, mess: 'Hết thời gian chờ');
      },
    );
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
        decoration: const InputDecoration(
          errorStyle: TextStyle(),
          // errorText: widget.errorText,
          hintText: "Nhập OTP",
          hintStyle: TextStyle(
              color: Color.fromRGBO(126, 123, 118, 1),
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Padding _buildFormLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 19),
              Text(
                'Nhập mã xác thự(OTP)\nđược gửi đến số điện thoại\n${widget.phoneNumber}',
                style: const TextStyle(color: Color.fromARGB(255, 94, 87, 87)),
              ),
            ],
          ),
          const SizedBox(height: 10),
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
                      verifyOTP(numberPhoneController.text, verificationId);
                    } else {
                      displayMess(false, mess: 'Chưa nhập OTP');
                    }
                  }
                },
                child: Text('Xác nhận',
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
          style: TextStyle(
              fontSize: screenWidth * 0.052,
              color: const Color.fromARGB(255, 203, 66, 107),
              fontWeight: FontWeight.w800),
        )
      ],
    );
  }

  @override
  displayMess(result, {phoneNumber = '', mess = ''}) {
    if (result! == false) {
      showToast(mess);
    } else if (result) {
      showToast(mess, backgroundColor: Colors.green);
    }
  }

  Future<void> verifyOTP(String enteredCode, String verificationId) async {
    if (verificationId == '') {
      displayMess(false, mess: 'Không thể xác nhận');
      return;
    }

    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: enteredCode,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);

      // ignore: use_build_context_synchronously
      Navigator.of(context).push(createRoutePushThrough(
          screen: SignUpScreen2(phoneNumber: widget.phoneNumber)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'session-expired') {
        displayMess(false, mess: 'OTP đã hết hạn vui lòng quay lại');
      }
    } catch (e) {
      displayMess(false, mess: e.toString());
    }
  }
}

extension CustomTextStyles on TextTheme {
  TextStyle get customHeadlineLarge1 {
    return headlineLarge!.copyWith(
        fontSize: screenWidth * 0.062,
        color: const Color.fromARGB(255, 203, 66, 107),
        fontWeight: FontWeight.w800);
  }
}
