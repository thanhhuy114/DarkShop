//Các button của Product
import 'package:darkshop/utils/untils.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key, required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: const ButtonStyle(
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(255, 203, 66, 107)),
          iconColor: MaterialStatePropertyAll(Colors.amberAccent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: screenWidth * 0.056,
          ),
          const SizedBox(width: 5.0, height: 50),
          Text(
            text,
            style:  TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: screenWidth * 0.037),
          ),
        ],
      ),
    );
  }
}
