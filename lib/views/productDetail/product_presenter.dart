//xử lý tương tác bên giao diện
//vd: nhấn nút ...
import 'dart:convert';
import 'package:darkshop/data/models/image_product.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:http/http.dart' as http;

class ProductPresenter {
  Product? pro;
  ProductPresenter({required this.pro});

  static get _hosting => 'http://192.168.1.3';

  static Future<Product> getPro(int id) async {
    var uri = '$_hosting:3000/products/${id}';

    try {
      var response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
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

class ProductImage {
  ImageProduct? proImg;
  ProductImage({required this.proImg});

  static get _hosting => 'http://192.168.1.3';

  static Future<List<String>> getImg(int id) async {
    var uri = '$_hosting:3000/img_products/all/${id}';
    var url =
        '''https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/''';
    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body.toString());
        // Chuyển đổi từ danh sách đối tượng dynamic sang danh sách String
        final List<String> data = jsonData.map((dynamic item) {
          if (item is Map<String, dynamic> && item.containsKey("image")) {
            String imageUrl = item["image"];
            if (!imageUrl.startsWith("http")) {
              imageUrl = url + imageUrl;
            }
            return imageUrl;
          } else {
            return ""; // hoặc giá trị mặc định khác tùy thuộc vào yêu cầu của bạn
          }
        }).toList();
        print(data);
        return data;
      } else {
        // Xử lý lỗi nếu có
        print('Lỗi - Mã trạng thái: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Lỗi - Catch: $e');
      return [];
    }
  }
}

