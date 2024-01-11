import 'package:darkshop/views/productManagement/components/img_button.dart';
import 'package:flutter/material.dart';

class ItemProdParams extends StatelessWidget {
  final VoidCallback ontap;
  ItemProdParams({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            ImgButton(ontap: ontap),
            const SizedBox(
              width: 5,
            ),
            const Column(
              children: [
                Text(
                  'Thông số kỹ thuật *',
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
            )
          ],
        ),
      ),
    );
  }
}
