import 'package:flutter/material.dart';

class ItemImgList extends StatelessWidget {
  const ItemImgList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imgAssets = [
      'sp1.webp',
      'sp2.webp',
      'sp3.webp',
      'sp4.webp',
      'sp5.webp',
    ];
    return SizedBox(
        height: MediaQuery.of(context).size.height / 6,
        child: Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: const BoxDecoration(color: Colors.white),
            child: ListView.builder(
                scrollDirection: axisDirectionToAxis(AxisDirection.right),
                itemCount: imgAssets.length,
                itemBuilder: (context, index) {
                  return Image.asset('assets/${imgAssets[index]}');
                })));
  }
}
