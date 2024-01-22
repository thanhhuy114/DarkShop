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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_user'] = id_user;
    data['idProduct'] = idProduct;
    data['count'] = count;
    return data;
  }
}
