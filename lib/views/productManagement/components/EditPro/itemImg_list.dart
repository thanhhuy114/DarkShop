import 'package:flutter/material.dart';

import '../AddPro/img_button.dart';

class ItemImg extends StatelessWidget {
  const ItemImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 6,
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [ImgButton(ontap: () {})],
        ),
      ),
    );
  }
}
