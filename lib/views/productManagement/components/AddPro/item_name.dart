import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  final String name;
  TextEditingController nameEdit = TextEditingController(text: '');
  ItemName({super.key, required this.name});

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
                controller: nameEdit,
                maxLength: 3000,
                maxLines: null,
              ),
            ],
          ),
        ));
  }
}
