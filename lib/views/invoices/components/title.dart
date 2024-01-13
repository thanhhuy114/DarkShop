import 'package:flutter/material.dart';

class TitleOM extends StatelessWidget {
  const TitleOM({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      child: const Text(
        'Quản lý đơn hàng',
        style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
      ),
    );
  }
}
