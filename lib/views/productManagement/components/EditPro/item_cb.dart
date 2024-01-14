import 'package:flutter/material.dart';

import '../AddPro/combo_box.dart';

class ItemCB extends StatelessWidget {
  const ItemCB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.list),
            const Text(
              'Loại sản phẩm',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Combobox(),
          ],
        ),
      ),
    );
  }
}
