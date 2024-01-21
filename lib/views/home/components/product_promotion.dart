import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';

class ProductPromotion extends StatelessWidget {
  const ProductPromotion({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          Navigator.of(context).push(createRoutePushThrough(
              screen: Scaffold(
            appBar: AppBar(),
            body: Container(color: Colors.yellow),
          )));
        },
        child: Ink(
          width: (screenWidth - 24) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Color.fromRGBO(149, 157, 165, 0.2),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(product.image!,
                    height: (screenWidth - 24) / 3, fit: BoxFit.cover),
              ),
              Container(
                // margin: const EdgeInsets.symmetric(vertical: 0),
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 242, 219, 218),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          formatCurrency(product.price),
                          style: TextStyle(
                              fontSize: screenWidth * 0.029,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: screenWidth * 0.085,
                      alignment: Alignment.center,
                      height: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(9)),
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets/home_screen/promotion_background.png'))),
                      child: Text(
                        '-${product.promotion}%',
                        style: TextStyle(
                            fontSize: screenWidth * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
