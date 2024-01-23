import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:darkshop/data/models/cart_custom.dart';

class CartLocalRepository {
  static const String key = 'cart_key';

  // Lưu danh sách giỏ hàng vào SharedPreferences
  static Future<void> saveCartList(List<CartCustom> cartList) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = jsonEncode(cartList.map((cart) => cart.toJson()).toList());
    prefs.setString(key, jsonString);
  }

  // Lấy danh sách giỏ hàng từ SharedPreferences
  static Future<List<CartCustom>> getCartList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(key);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((json) => CartCustom.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}
