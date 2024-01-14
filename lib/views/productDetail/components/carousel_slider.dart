// carousel_slider.dart

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyCarouselSlider extends StatelessWidget {
  const MyCarouselSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593087770791_HASP-ASUS-FX506H-1.jpg',
      'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593087770791_HASP-ASUS-FX506H-5.jpg',
      'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593091364580_HASP-ASUS-FX506H-9.jpg',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: imageUrls.map((imageUrl) {
        return Container(
          child: Center(
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        );
      }).toList(),
    );
  }
}
