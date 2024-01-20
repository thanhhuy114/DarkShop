import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

var url = '''https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/''';

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
      image: json[url + 'image'],
      id_product: json['id_product'],
    );
  }

  List<ImageProduct> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => ImageProduct.fromJson(json)).toList();
  }
}
