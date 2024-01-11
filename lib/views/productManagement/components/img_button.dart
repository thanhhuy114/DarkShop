import 'package:flutter/material.dart';

class ImgButton extends StatelessWidget {
  VoidCallback ontap;
  ImgButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: Image.asset('assets/add_img.png'),
          ),
        ));
  }
}
