import 'package:flutter/material.dart';

class ItemName extends StatelessWidget {
  const ItemName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tên sản phẩm *',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                maxLength: 3000,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: 'Enter your text (max 3000 characters)',
                ),
              ),
            ],
          ),
        ));
  }
}
