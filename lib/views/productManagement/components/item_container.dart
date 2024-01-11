import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final String price;
  final IconData icon;
  final String label;
  const ItemContainer(
      {super.key,
      required this.icon,
      required this.label,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [Icon(icon), Text(label), Text(price)],
        ),
      ),
    );
  }
}
