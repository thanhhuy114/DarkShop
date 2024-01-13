import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  const ItemContainer({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.white,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(icon),
            label: Text(label),
          ),
        ));
  }
}
