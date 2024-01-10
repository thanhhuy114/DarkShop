import 'package:darkshop/views/productManagement/components/image_list.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class MultiImg extends StatefulWidget {
  @override
  _MultiImgState createState() => _MultiImgState();
}

class _MultiImgState extends State<MultiImg> {
  List<Asset> images = <Asset>[];

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 5,
        enableCamera: true,
        selectedAssets: images,
      );
    } on Exception catch (e) {
      print(e);
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: loadAssets,
          child: const Text('Chọn ảnh'),
        ),
        Expanded(
          child: ImageList(images: images),
        ),
      ],
    );
  }
}
