import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Product {
  int id;
  int idType;
  String? image;
  String? imageInfo;
  String name;
  String description;
  int price;
  int promotion;
  int repository;
  DateTime postAt;

  Product({
    required this.id,
    required this.idType,
    required this.image,
    required this.imageInfo,
    required this.name,
    required this.description,
    required this.price,
    required this.promotion,
    required this.repository,
    required this.postAt,
  });

  Product.empty()
      : id = 0,
        idType = 0,
        image = '',
        imageInfo = '',
        name = '',
        description = '',
        price = 0,
        promotion = 0,
        repository = 0,
        postAt = DateTime.now();

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      idType: json['idType'],
      image: json['image'],
      imageInfo: json['imageInfo'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      promotion: json['promotion'],
      repository: json['repository'],
      postAt: DateTime.parse(json['postAt']),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['idType'] = this.idType;
    data['image'] = this.image;
    data['imageInfo'] = this.imageInfo;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['promotion'] = this.promotion;
    data['repository'] = this.repository;
    data['postAt'] = this.postAt;
    return data;
  }
}
