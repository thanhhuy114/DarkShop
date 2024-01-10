import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class ImageList extends StatelessWidget {
  final List<Asset> images;

  ImageList({required this.images});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      },
    );
  }
}
