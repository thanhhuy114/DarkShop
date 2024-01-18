import 'dart:io';
import 'dart:typed_data';

class Product {
  int id;
  int idType;
  Uint8List? image;
  Uint8List? imageInfo;
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
        image = null,
        imageInfo = null,
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
        postAt: DateTime.parse(json['postAt']));
  }

  Future<Uint8List> imageFileToUint8List(String imagePath) async {
    // Đọc nội dung của tệp hình ảnh thành Uint8List
    File imageFile = File(imagePath);
    List<int> imageBytes = await imageFile.readAsBytes();

    // Chuyển đổi List<int> thành Uint8List
    Uint8List uint8List = Uint8List.fromList(imageBytes);

    return uint8List;
  }
}
