import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: 80,
      width: MediaQuery.of(context).size.width * 2 / 6,
      decoration: BoxDecoration(
        image: product.image != null
            ? DecorationImage(
                image: MemoryImage(product.image!), fit: BoxFit.cover)
            : const DecorationImage(
                image: AssetImage(Constants.avatarDefault), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (product.promotion > 0)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MyColors.backgroundPromotion,
              ),
              child: Text("-${product.promotion}%"),
            )
        ],
      ),
    );
  }
}
