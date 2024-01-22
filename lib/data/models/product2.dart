

class Product2{
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

  Product2({
    required this.id,
    required this.idType,
    this.image,
    this.imageInfo,
    required this.name,
    required this.description,
    required this.price,
    required this.promotion,
    required this.repository,
    required this.postAt,
  });

  factory Product2.fromJson(Map<String, dynamic> json) {
    return Product2(
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

}
