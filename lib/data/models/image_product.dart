import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:darkshop/utils/constants.dart';


class ImageProduct {
  int id;
  String? image;
  int id_product;

  ImageProduct(
      {required this.id, required this.image, required this.id_product});

  ImageProduct.empty() //khởi tạo giá trị mặc định cho ImageProduct
      : id = 0,
        image = '',
        id_product = 0;

  factory ImageProduct.fromJson(Map<String, dynamic> json) {
    return ImageProduct(
      id: json['id'],
      image: json[Constants.pathClould + 'image'],
      id_product: json['id_product'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['id_product'] = this.id_product;
    return data;
  }

  List<ImageProduct> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ImageProduct.fromJson(json)).toList();
  }
}
