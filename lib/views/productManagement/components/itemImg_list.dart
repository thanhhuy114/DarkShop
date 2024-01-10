import 'package:darkshop/views/productDetail/components/img_button.dart';
import 'package:darkshop/views/productManagement/components/image_list.dart';
import 'package:darkshop/views/productManagement/components/img_button.dart';
import 'package:flutter/material.dart';

class itemImg extends StatelessWidget {
  const itemImg({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 10,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            ImageList(images: List.empty()),
            ImgButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
