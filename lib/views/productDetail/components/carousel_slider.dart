// carousel_slider.dart

import 'package:carousel_slider/carousel_slider.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:flutter/material.dart';

class MyCarouselSlider extends StatelessWidget {
  final Future<List<String>> listUrlImg;
  final double height;
  const MyCarouselSlider({Key? key, required this.listUrlImg, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: listUrlImg,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No image data available');
        } else {
          Future<List<String>> stringListFuture =
              Future<List<String>>.value(snapshot.data!.cast<String>());

          return _buildCarouselSlider(stringListFuture);
        }
      },
    );
  }

  Widget _buildCarouselSlider(Future<List<String>> stringListFuture) {
    return FutureBuilder<List<String>>(
      future: stringListFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Text('No image data available');
        } else {
          List<String> urls = snapshot.data!;
          return CarouselSlider(
            items: urls.map((url) {
              return Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      foregroundDecoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20)),
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Image.network(Constants.pathClould + url,
                          fit: BoxFit.fill),
                    ),
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: height,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          );
        }
      },
    );
  }
}
