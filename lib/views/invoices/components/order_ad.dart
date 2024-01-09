import 'package:flutter/material.dart';

class OrderAd extends StatelessWidget {
  const OrderAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.lightBlue),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/Duy/5.png',
                width: 30,
                height: 30,
              ),
              const Text('Tên khách hàng 1')
            ],
          )
        ],
      ),
    );
  }
}
