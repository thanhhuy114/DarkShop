import 'package:flutter/material.dart';
import '../../../utils/screen_size.dart';

// ignore: must_be_immutable
class PasswordTextField extends StatefulWidget {
  PasswordTextField(
      {super.key, required this.controller, required this.errorText});
  final TextEditingController controller;
  String? errorText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isHidePass = true;
  @override
  Widget build(BuildContext context) {
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
        obscureText: isHidePass,
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 185, 88),
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w500),
        controller: widget.controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(),
          errorText: widget.errorText,
          hintText: "Mật khẩu",
          hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 185, 88, 1),
              fontWeight: FontWeight.w500),
          suffix: GestureDetector(
            onTap: () {
              setState(() => isHidePass = !isHidePass);
            },
            child: Icon(
              isHidePass ? Icons.visibility_off : Icons.visibility,
              size: screenWidth * 0.055,
              color: const Color.fromARGB(255, 204, 148, 71),
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
