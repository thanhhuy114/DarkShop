import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.name,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        if (product.promotion == 0)
          Text(
            "${product.price}đ",
          )
        else
          Row(
            children: [
              Text(
                "${product.price * (100 - product.promotion) ~/ 100}đ",
                style: const TextStyle(
                    color: MyColors.promotionPrice,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.all(3)),
              Text("${product.price}đ", style: const TextStyle(decoration: TextDecoration.lineThrough),)
            ],  
          )
      ],
    );
  }
}
