import 'package:flutter/material.dart';

class HomePresenter {
  static Widget generateImage(
      BuildContext context, int itemIndex, int pageViewIndex) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/home_screen/spn_${itemIndex + 1}.png',
            fit: BoxFit.cover),
      ),
    );
  }

  







}
