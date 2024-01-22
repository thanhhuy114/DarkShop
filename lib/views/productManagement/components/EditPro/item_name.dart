import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemName extends StatelessWidget {
  TextEditingController nameEdit = TextEditingController(text: '');
  ItemName({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tên sản phẩm *',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                maxLength: 3000,
                maxLines: null,
                controller: nameEdit,
              ),
            ],
          ),
        ));
  }
}
