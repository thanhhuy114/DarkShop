import 'dart:typed_data';

class Cart {
  int id;
  int id_user;
  int id_product;
  int count;

  Cart({
    required this.id,
    required this.id_user,
    required this.id_product,
    required this.count
  });

  Cart.empty()
      : id = 0,
        id_user=0,
        id_product=0,
        count=0;

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
        id: json['id'],
        id_user: json['id_user'],
        id_product: json['id_product'],
        count: json['count']);
  }
   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_user'] = this.id_user;
    data['idProduct'] = this.id_product;
    data['count'] = this.count;
    return data;
  }
}
