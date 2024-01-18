import 'package:darkshop/views/productManagement/components/AddPro/img_button.dart';
import 'package:darkshop/views/productManagement/components/AddPro/item_container.dart';
import 'package:darkshop/views/productManagement/components/EditPro/img_list.dart';
import 'package:flutter/material.dart';

class ItemImgEdit extends StatelessWidget {
  const ItemImgEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        children: [
          ItemImgList(),
          ImgButton(ontap: () {}),
        ],
      ),
    );
  }
}
