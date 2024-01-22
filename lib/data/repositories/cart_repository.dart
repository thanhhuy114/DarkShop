import 'dart:convert';

import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/models/cart_custom.dart';
import 'package:darkshop/data/repositories/repository.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:http/http.dart' as http;

import '../models/cart_local.dart';

class CartRepository implements Repository {
  @override
  Future<void> deteleCart(int idCart) async {
    var url = Uri.parse('$hosting/cart/$idCart');
    var repose = await http.delete(url);
    print('Trang thai :${repose.statusCode}');
  }

  @override
  Future<List<CartCustom>> getCardList(int idUser) async {
    List<CartCustom> cartList = [];
    var url = Uri.parse('$hosting/cart/all/$idUser');
    var repose = await http.get(url);
    print('Trang thai :${repose.statusCode}');
    var body = jsonDecode(repose.body.toString());
    for (var i = 0; i < body.length; i++) {
      cartList.add(CartCustom.fromJson(body[i]));
    }
    return cartList;
  }

  @override
  Future<void> postCart(Cart cart) async {
    try {
      final response = await http.post(
        Uri.parse('$hosting/cart/'),
        body:{
          "idProduct":cart.idProduct.toString(),
          "count":cart.count.toString(),
          "id_user":cart.id_user.toString()
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        // Xử lý kết quả thành công
        print('Sản phẩm đã được thêm vào giỏ hàng.');
        // Cập nhật giỏ hàng trong ứng dụng Flutter nếu cần
      } else {
        // Xử lý lỗi từ API
        print('Lỗi: ${response.statusCode}, ${response.body}');
        // Hiển thị thông báo lỗi cho người dùng hoặc xử lý theo cách phù hợp
      }
    } catch (error) {
      // Xử lý lỗi kết nối
      print('Lỗi kết nối: $error');
      // Hiển thị thông báo lỗi cho người dùng hoặc xử lý theo cách phù hợp
    }
  }

  @override
  Future<void> pullCart(Cart Cart, int id_product) async {
    try {
      final response = await http.put(Uri.parse('${hosting}/cart/$id_product'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json);

      if (response.statusCode == 200) {
        print('Cập nhật Cart ở sever thành công');
      } else {
        print('Cập nhật user ở sever thất bại');
      }
    } catch (e) {
      print('Lỗi Cập nhật ở sever user: $e');
    }
  }

  @override
  Future<List<CartCustom>> getLocal(int idUser) async {
    List<CartCustom> cartData = await getCardList(idUser);
    CartService cartService = CartService();
    await cartService.saveCart(cartData);
    return cartData;
  }

  @override
  Future<Cart> getCart(int id) async {
    var url = Uri.parse('$hosting/cart/$id');
    var repose = await http.get(url);
    print('Trang thai :${repose.statusCode}');
    var body = jsonDecode(repose.body.toString());

    return body;
  }
}
