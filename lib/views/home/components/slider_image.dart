import 'package:carousel_slider/carousel_slider.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({super.key});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int currentPos = 0;
  int itemCount = 7;

  Widget _generateImage(
      BuildContext context, int itemIndex, int pageViewIndex) {
    return InkWell(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset('assets/home_screen/spn_${itemIndex + 1}.png',
            fit: BoxFit.cover),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CarouselSlider.builder(
              itemCount: itemCount,
              itemBuilder: _generateImage,
              options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    setState(() => currentPos = index),
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 0.96,
                aspectRatio: 1976 / 688,
              )),
        ),
        Positioned(
            bottom: screenHeight * 0.011,
            right: 0,
            left: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                  itemCount,
                  (index) => Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        height: 6,
                        width: 6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: index != currentPos
                              ? Colors.white.withOpacity(0.5)
                              : Colors.white,
                        ),
                      )),
            ))
      ],
    );
  }
}
