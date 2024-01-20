import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/productDetail/components/product_info.dart';
import 'package:flutter/material.dart';

class ProductInfoScreen extends StatefulWidget {
  final Product pro;
   ProductInfoScreen({super.key,required this.pro});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Thông số kỹ thuật',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.amber,
        ),
        body: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 255, 185, 88),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Image.network(
                      widget.pro.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProductInfo(
                    textInfo: widget.pro.description,
                    lineShow: false,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
