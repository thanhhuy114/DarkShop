//nút chuyển màn thông số kỹ thuật
import 'package:flutter/material.dart';

class specsButton extends StatefulWidget {
  const specsButton({super.key});

  @override
  State<specsButton> createState() => _specsButtonState();
}

class _specsButtonState extends State<specsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: const Column(
        children: [
          Icon(Icons.laptop_mac),
          Text(
            "Thông số kỹ thuật",
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
