//màn hình phóng to ảnh
import 'package:darkshop/views/productDetail/components/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImgZoonScreen extends StatefulWidget {
  const ImgZoonScreen({super.key});

  @override
  State<ImgZoonScreen> createState() => _ImgZoonScreenState();
}

class _ImgZoonScreenState extends State<ImgZoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
        ),
        body: Container(
          color: Colors.amber.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // children: const [MyCarouselSlider()],
          ),
        ));
  }
}
