import 'dart:typed_data';

class Cart {
  int id;
  int id_user;
  int idProduct;
  int count;

  Cart({
    required this.id,
    required this.id_user,
    required this.idProduct,
    required this.count
  });

  Cart.empty()
      : id = 0,
        id_user=0,
        idProduct=0,
        count=0;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        id_user: json['id_user'],
        idProduct: json['idProduct'],
        count: json['count']);
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.id_user;
    data['idProduct'] = this.idProduct;
    data['count'] = this.count;
    return data;
  }
}
