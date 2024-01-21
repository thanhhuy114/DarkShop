import 'dart:convert';

import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  static Future<List<Product>> getAllProducts() async {
    List<Product> products = [];
    try {
      await http.get(Uri.parse('$hosting/products/')).then((response) {
        final String jsonBody = response.body;
        final statusCode = response.statusCode;

        if (statusCode < 200 || statusCode >= 300 || jsonBody == 'null') {
          print(response.body);
          return [];
        }

        final data = json.decode(jsonBody);

        try {
          products = data
              .map((product) => Product.fromJson(product))
              .toList()
              .cast<Product>();   
        } catch (e) {
          print(e);
        }
      });

      return products;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
