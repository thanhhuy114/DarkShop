import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  TextEditingController valueEdit = TextEditingController();
  ItemContainer(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        color: Colors.white,
        child: TextField(
          keyboardType: TextInputType.number,
          controller: valueEdit,
          decoration: InputDecoration(
            icon: Icon(icon),
            label: Text(label),
          ),
        ));
  }
}
