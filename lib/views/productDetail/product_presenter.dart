//xử lý tương tác bên giao diện
//vd: nhấn nút ...
import 'dart:convert';
import 'dart:ffi';
import 'package:darkshop/data/models/image_product.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/untils.dart';
import 'package:http/http.dart' as http;

class ProductPresenter {
  Product? pro;
  ProductPresenter({required this.pro});

  static Future<Product> getPro(int id) async {
    var uri = '${Constants.hosting}/products/$id';
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

  Future<void> deleteProduct(int idProduct) async {
    var uri = '${Constants.hosting}/products/$idProduct';
    try {
      var response = await http.delete(Uri.parse(uri));
      if (response.statusCode == 200) {
        print('Xóa thành công');
      }
    } catch (e) {
      print('Lỗi $e');
    }

//   Future<void> deleteCart(int id) async {
//   await _repository.deleteProduct(id);//goi ham
// }
  }
}

class ProductImage {
  ImageProduct? proImg;
  ProductImage({required this.proImg});

  static Future<List<String>> getImg(int id) async {
    return [
      'darkshop/image/product/mobile/hyat6tjplobotd4otw1f.webp',
      'darkshop/image/product/mobile/hhvhfgamcox0bydnmetx.webp',
      'darkshop/image/product/mobile/u5i8wk21m9wct9slhde0.webp',
      'darkshop/image/product/mobile/hyat6tjplobotd4otw1f.webp',
      'darkshop/image/product/mobile/fydznv388h0nvva3100c.webp'
    ];

    var uri = '${Constants.hosting}/img_products/all/$id';
    try {
      final response = await http.get(Uri.parse(uri));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body.toString());
        // Chuyển đổi từ danh sách đối tượng dynamic sang danh sách String
        final List<String> data = jsonData.map((dynamic item) {
          if (item is Map<String, dynamic> && item.containsKey("image")) {
            String imageUrl = item["image"];
            if (!imageUrl.startsWith("http")) {
              imageUrl = Constants.pathClould + imageUrl;
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
