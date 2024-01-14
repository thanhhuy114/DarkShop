//giao diện product
import 'package:darkshop/views/productDetail/components/button.dart';
import 'package:darkshop/views/productDetail/components/carousel_slider.dart';
import 'package:darkshop/views/productDetail/components/img_button.dart';
import 'package:darkshop/views/productDetail/components/product_info.dart';
import 'package:darkshop/views/productDetail/components/specifications_button.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 185, 88),
      appBar: AppBar(
        title: const Text("Thông số kỹ thuật"),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: MyCarouselSlider(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              imgButton(),
              specsButton(),
            ],
          ),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                      'Laptop Asus TUF Gaming FX506HF-HN017W i5 11400H/16GB/512GB/GeForce RTX 2050 4GB/Win11',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        '17,990,000',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.red),
                      ),
                      RichText(
                          text: const TextSpan(
                        text: '21,990,000',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.red,
                          fontSize:
                              24, // Optional: Change the strikethrough color
                          decorationThickness: 2.0,
                        ),
                      )),
                      const Text(
                        ' -17%',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                          text: 'Mua ngay',
                          icon: Icons.shopping_cart_outlined,
                          onPressed: () {}),
                      CustomButton(
                          text: 'Thêm giỏ hàng',
                          icon: Icons.shopping_cart_checkout_sharp,
                          onPressed: () {})
                    ],
                  ),
                ],
              )),
          const productInfo(
            textInfo: 'Thông tin hàng hóa\n'
                'P/N: FX506HF-HN017W\n'
                'Thương hiệu: Asus\n'
                'Xuất xứ: Trung Quốc\n'
                'Thời điểm ra mắt: 4/2023\n'
                'Thời gian bảo hành (tháng): 24\n'
                'Hướng dẫn bảo quản: Để nơi khô ráo, nhẹ tay, dễ vỡ.\n'
                'Hướng dẫn sử dụng: Xem trong sách hướng dẫn sử dụng',
          ),
          CustomButton(
              text: 'Xem thêm', icon: Icons.view_agenda_sharp, onPressed: () {})
        ],
      )),
    );
  }
}
