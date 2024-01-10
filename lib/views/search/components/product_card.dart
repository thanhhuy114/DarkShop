import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/search/components/product_image.dart';
import 'package:darkshop/views/search/components/product_text.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: MyColors.backgroundCard),
            child: Row(children: [
              ProductImage(product: product),
              const Padding(padding: EdgeInsets.all(5)),
              ProductText(product: product)
            ]),);
  }
}
