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
              ItemName(name: ''),
              ItemProPara(ontap: () {}),
              const ItemCB(),
              ItemContainer(icon: Icons.price_change, label: 'Giá', value: ''),
              ItemContainer(
                  icon: Icons.discount_outlined, label: 'Giảm giá', value: ''),
              ItemContainer(
                  icon: Icons.warehouse_outlined, label: 'Kho *', value: ''),
              const CusBtn(text: 'Lưu')
            ],
          ),
        ));
  }
}
