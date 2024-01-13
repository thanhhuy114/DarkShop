import 'package:darkshop/views/productManagement/components/AddPro/custom_button.dart';
import 'package:darkshop/views/productManagement/components/AddPro/itemImg_list.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_cb.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_container.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_name.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_prodparams.dart';
import 'package:flutter/material.dart';

class addProSCreen extends StatefulWidget {
  const addProSCreen({super.key});

  @override
  State<addProSCreen> createState() => _addProSCreenState();
}

class _addProSCreenState extends State<addProSCreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Thêm sản phẩm '),
          backgroundColor: Colors.redAccent,
        ),
        body: Container(
          decoration: const BoxDecoration(color: Colors.amber),
          child: ListView(
            children: [
              const ItemImg(),
              const ItemName(),
              ItemProPara(ontap: () {}),
              const ItemCB(),
              const ItemContainer(icon: Icons.price_change, label: 'Giá'),
              const ItemContainer(
                  icon: Icons.discount_outlined, label: 'Giảm giá'),
              const ItemContainer(
                  icon: Icons.warehouse_outlined, label: 'Kho *'),
              const CusBtn(text: 'Lưu')
            ],
          ),
        ));
  }
}
