import 'package:darkshop/data/models/product_type.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:flutter/material.dart';

class ProductType extends StatelessWidget {
  const ProductType({super.key, required this.productType});
  final ProductTypeModel productType;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 5),
      width: (screenWidth - 20 * 6) / 5,
      color: const Color.fromARGB(255, 244, 208, 157),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.only(top: 2, bottom: 5, right: 2, left: 2),
          height: (screenWidth - 20 * 6) / 5 - 4,
          width: (screenWidth - 20 * 6) / 5,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 59, 181, 226),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset(productType.pathImage,
              fit: BoxFit.cover),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            productType.name,
            maxLines: 2,
            style: TextStyle(
                fontSize: screenWidth * 0.027,
                fontWeight: FontWeight.w400,
                color: const Color.fromARGB(255, 77, 73, 73)),
          ),
        )
      ]),
    );
  }
}
