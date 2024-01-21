import 'package:cached_network_image/cached_network_image.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/no_internet/no_internet.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Navigator.of(context).push(createRoutePushThrough(
            screen: AppState.isConnetInternet
                ? Scaffold(
                    appBar: AppBar(),
                    body: Container(color: Colors.yellow),
                  )
                : const NoInternetScreen()));
      },
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(149, 157, 165, 0.2),
                offset: Offset(0, 8),
                blurRadius: 24,
                spreadRadius: 0),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8)),
                child: CachedNetworkImage(
                  useOldImageOnUrlChange: true,
                  imageUrl: '$urlImage/${product.image!}',
                  fit: BoxFit.contain,
                  placeholder: (BuildContext context, String url) {
                    return Image.asset('assets/logo.png');
                  },
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/logo.png'),
                )),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('${product.name}\n',
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 10),
              child: Row(
                children: [
                  Text(
                      formatCurrency((product.price -
                              (product.price * product.promotion / 100))
                          .toInt()),
                      style: TextStyle(
                          fontSize: screenWidth * 0.038,
                          color: Colors.red,
                          fontWeight: FontWeight.bold)),
                  Visibility(
                    visible: product.promotion > 0,
                    child: Container(
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 243, 88, 77)
                              .withOpacity(0.2)),
                      child: Text('-${product.promotion}%',
                          style: TextStyle(
                              fontSize: screenWidth * 0.03, color: Colors.red)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
