//màn hình phóng to ảnh
import 'package:darkshop/views/productDetail/components/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImgZoonScreen extends StatefulWidget {
  final Future<List<String>> urlImg;
  ImgZoonScreen({super.key, required this.urlImg});

  @override
  State<ImgZoonScreen> createState() => _ImgZoonScreenState();
}

class _ImgZoonScreenState extends State<ImgZoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white),
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCarouselSlider(
                listUrlImg: widget.urlImg,
                height: 350,
              )
            ],
          ),
        ));
  }
}
