import 'package:flutter/material.dart';

import '../AddPro/img_button.dart';

class ItemProPara extends StatelessWidget {
  final VoidCallback ontap;
  final TextEditingController proPraEdit = TextEditingController(text: '');
  ItemProPara({super.key, required this.ontap, required this.proPra});
  final String proPra;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Thông số sản phẩm ',
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextField(
                maxLength: 3000,
                maxLines: null,
                controller: proPraEdit,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ImgButton(ontap: ontap)],
              ),
            ],
          ),
        ));
  }
}
