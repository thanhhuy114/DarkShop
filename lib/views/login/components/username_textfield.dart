import 'package:darkshop/utils/untils.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UsernameTextfield extends StatelessWidget {
  UsernameTextfield(
      {super.key, required this.controller, required this.errorText});
  final TextEditingController controller;
  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.084),
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.045, vertical: screenWidth * 0.0055),
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23),
        color: Colors.white,
      ),
      child: TextField(
        style: TextStyle(
            color: const Color.fromARGB(255, 255, 185, 88),
            fontSize: screenWidth * 0.033,
            fontWeight: FontWeight.w500),
        controller: controller,
        decoration:  InputDecoration(
          errorStyle: const TextStyle(),
          errorText: errorText,
          hintText: "Số điện thoại/Email",
          hintStyle: const TextStyle(
              color: Color.fromRGBO(255, 185, 88, 1),
              fontWeight: FontWeight.w500),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
