import 'package:flutter/material.dart';

class ItemContainer extends StatelessWidget {
  final String value;
  final IconData icon;
  final String label;
  TextEditingController valueEdit = TextEditingController(text: '');
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
          controller: valueEdit,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            icon: Icon(icon),
            label: Text(label),
          ),
        ));
  }
}
