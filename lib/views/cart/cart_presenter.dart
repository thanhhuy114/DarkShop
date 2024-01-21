//xử lý tương tác bên giao diện
//vd: nhấn nút ...

import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/repositories/user_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CartPresenter {
  List<Cart> Carts;
  Cart? userSeleted;
  Function reload;

  CartPresenter({required this.Carts, required this.reload}) {
    reload();
  }

  static get _hosting => 'http://192.168.1.3';

  static Future<Cart> getCart(int id_user) async {
    var uri = '$_hosting:3000/products/${id_user}';

    try {
      var response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(Cart.fromJson(data));
        return Cart.fromJson(data);
      } else if (response.statusCode > 200) {
        print('get field: ${response.body}');
      } else {
        print('Error - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error - Catch: $e');
    }

    return Cart.empty();
  }
}
