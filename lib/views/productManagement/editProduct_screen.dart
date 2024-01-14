import 'package:darkshop/views/productManagement/components/EditPro/item_cb.dart';
import 'package:darkshop/views/productManagement/components/EditPro/item_container.dart';
import 'package:darkshop/views/productManagement/components/EditPro/item_img.dart';
import 'package:darkshop/views/productManagement/components/EditPro/item_prodparams.dart';
import 'package:flutter/material.dart';

import 'components/AddPro/custom_button.dart';
import 'components/EditPro/item_name.dart';

class EditProScreen extends StatefulWidget {
  const EditProScreen({super.key});

  @override
  State<EditProScreen> createState() => _EditProScreenState();
}

class _EditProScreenState extends State<EditProScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chinh sua san pham'),
      ),
      body: Container(
        color: Colors.amber,
        child: ListView(children: [
          ItemImgEdit(),
          ItemName(name: 'laptap15cu'),
          ItemProPara(ontap: () {}, proPra: '15cu'),
          ItemCB(),
          ItemContainer(
              icon: Icons.price_change, label: 'gia', value: '500000000'),
          ItemContainer(icon: Icons.discount, label: 'khuyen mai', value: '17'),
          ItemContainer(icon: Icons.warehouse, label: 'Kho hang', value: '6'),
          CusBtn(text: 'Luu')
        ]),
      ),
    );
  }
}
