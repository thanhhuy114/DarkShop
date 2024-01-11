import 'package:darkshop/views/productManagement/components/combo_box.dart';
import 'package:flutter/material.dart';

class itemCB extends StatelessWidget {
  const itemCB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [Icon(Icons.list), Combobox()],
        ),
      ),
    );
  }
}
