//màn hình phóng to ảnh
import 'package:darkshop/views/productDetail/components/carousel_slider.dart';
import 'package:flutter/material.dart';

class imgZoonScreen extends StatefulWidget {
  const imgZoonScreen({super.key});

  @override
  State<imgZoonScreen> createState() => _imgZoonScreenState();
}

class _imgZoonScreenState extends State<imgZoonScreen> {
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
            children: const [MyCarouselSlider()],
          ),
        ));
  }
}
