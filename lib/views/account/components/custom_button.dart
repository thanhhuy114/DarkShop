import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onClick});
  final String title;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick;
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration:  BoxDecoration(border: Border.all()),
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title, style: const TextStyle(fontSize: 16),), const Icon(Icons.chevron_right)],
          ),
        ),
      ),
    );
  }
}
