import 'package:flutter/material.dart';

class CusBtn extends StatelessWidget {
  final String text;
  const CusBtn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.redAccent,
        ),
        width: MediaQuery.of(context).size.width / 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(text)],
        ),
      ),
    );
  }
}
