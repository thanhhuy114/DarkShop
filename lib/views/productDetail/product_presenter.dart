//xử lý tương tác bên giao diện
//vd: nhấn nút ...
import 'dart:convert';

import 'package:darkshop/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductPresenter {
  Product? pro;
  ProductPresenter({required this.pro});

  static get _hosting => 'http://192.168.1.9';

  static Future<Product> getPro(int id) async {
    var uri = '$_hosting:3000/products/${id}';

    try {
      var response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        var data = json.decode(response.body.toString());
        print(Product.fromJson(data));
        return Product.fromJson(data);
      } else if (response.statusCode > 200) {
        print('get field: ${response.body}');
      } else {
        print('Error - Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error - Catch: $e');
    }

    return Product.empty();
  }
}
