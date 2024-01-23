import 'dart:typed_data';

class CartCustom {
  late int id;
  late int idUser;
  late int count;
  late String name;
  late int idProduct;
  late String image;
  late int price;
  late int promotion;

  CartCustom(
      {required this.id,
      required this.idUser,
      required this.count,
      required this.name,
      required this.idProduct,
      required this.image,
      required this.price,
      required this.promotion});

  CartCustom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idUser = json['id_user'];
    count = json['count'];
    name = json['name'];
    idProduct = json['idProduct'];
    image = json['image'];
    price = json['price'];
    promotion = json['promotion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.idUser;
    data['count'] = this.count;
    data['name'] = this.name;
    data['idProduct'] = this.idProduct;
    data['image'] = this.image;
    data['price'] = this.price;
    data['promotion'] = this.promotion;
    return data;
  }
}
