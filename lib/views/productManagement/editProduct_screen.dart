import 'package:darkshop/views/productManagement/components/AddPro/custom_button.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_cb.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_container.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_name.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_prodparams.dart';
import 'package:darkshop/views/productManagement/components/EditPro/img_list.dart';
import 'package:darkshop/views/productManagement/components/EditPro/item_img.dart';
import 'package:flutter/material.dart';

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
          ItemName(),
          ItemProPara(ontap: () {}),
          ItemCB(),
          ItemContainer(icon: Icons.price_change, label: 'gia'),
          ItemContainer(icon: Icons.discount, label: 'khuyen mai'),
          ItemContainer(icon: Icons.warehouse, label: 'Kho hang'),
          CusBtn(text: 'Luu')
        ]),
      ),
    );
  }
}
