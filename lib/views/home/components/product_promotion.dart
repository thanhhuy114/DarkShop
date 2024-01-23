import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:darkshop/views/no_internet/no_internet.dart';
import 'package:darkshop/views/productDetail/product_screen.dart';
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
             screen: GlobalData.isConneted!
                ? ProductScreen(id: product.id)
                : const NoInternetScreen()));
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
                  child: CachedNetworkImage(
                    useOldImageOnUrlChange: true,
                    height: (screenWidth - 24) / 3,
                    fit: BoxFit.cover,
                    imageUrl: '${Constants.pathClould}/${product.image!}',
                    placeholder: (BuildContext context, String url) {
                      return Image.asset('assets/logo.png');
                    },
                    errorWidget: (context, url, error) =>
                        Image.asset('assets/logo.png'),
                  )),
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
                          formatCurrency(product.price - product.price * product.promotion ~/ 100),
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
