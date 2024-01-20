//giao diện product
import 'package:darkshop/data/models/image_product.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/productDetail/components/button.dart';
import 'package:darkshop/views/productDetail/components/carousel_slider.dart';
import 'package:darkshop/views/productDetail/components/img_button.dart';
import 'package:darkshop/views/productDetail/components/product_info.dart';
import 'package:darkshop/views/productDetail/components/specifications_button.dart';
import 'package:darkshop/views/productDetail/productInfo_screen.dart';
import 'package:darkshop/views/productDetail/product_presenter.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final int id;
  const ProductScreen({super.key, required this.id});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late Future<Product> product;
  late Future<List<String>> productImg;
  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  _initializeData() async {
    try {
      product = ProductPresenter.getPro(widget.id);
      productImg = ProductImage.getImg(widget.id);
      print(ProductPresenter.getPro(widget.id));
      setState(() {}); // Ensure a rebuild after data is fetched
    } catch (error) {
      print("Error fetching product image: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 185, 88),
      appBar: AppBar(
        title: const Text("Chi tiết sản phẩm"),
        backgroundColor: Color.fromARGB(255, 255, 185, 88),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<Product>(
          future: product,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData) {
              return const Text('No data available');
            } else {
              Product product = snapshot.data!;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:
                        MyCarouselSlider(listUrlImg: productImg, height: 250),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImgButton(urlImg: productImg),
                      specsButton(pro: product),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(
                          product.name.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              (product.price -
                                      (product.price * product.promotion / 100))
                                  .toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 24,
                                color: Colors.red,
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                text: product.price.toString(),
                                style: const TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  fontSize: 24,
                                  decorationThickness: 2.0,
                                ),
                              ),
                            ),
                            Text(
                              '${product.promotion.toString()}%',
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomButton(
                              text: 'Mua ngay',
                              icon: Icons.shopping_cart_outlined,
                              onPressed: () {},
                            ),
                            CustomButton(
                              text: 'Thêm giỏ hàng',
                              icon: Icons.shopping_cart_checkout_sharp,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  ProductInfo(
                      textInfo: product.description.toString(), lineShow: true),
                  CustomButton(
                    text: 'Xem thêm',
                    icon: Icons.view_agenda_sharp,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductInfoScreen(pro: product),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
