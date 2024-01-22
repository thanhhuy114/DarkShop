import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImgButton extends StatelessWidget {
  VoidCallback ontap;
  ImgButton({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 20,
            child: Image.asset(
              'assets/add_img.png',
              cacheHeight: 150,
              width: 80,
            ),
          ),
        ));
  }
}
