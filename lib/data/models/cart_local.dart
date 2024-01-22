import 'dart:convert';
import 'package:darkshop/data/models/cart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static const String _cartKey = 'cart';

  Future<void> saveCart(List<Cart> cart) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStringList = cart.map((item) => jsonEncode(item.toJson())).toList();
    prefs.setStringList(_cartKey, cartStringList);
  }

  Future<List<Cart>> getCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cartStringList = prefs.getStringList(_cartKey);
    if (cartStringList == null) {
      return [];
    }

    List<Cart> cart = cartStringList.map((item) {
      Map<String, dynamic> json = jsonDecode(item);
      return Cart.fromJson(json);
    }).toList();

    return cart;
  }

  Future<void> addToCart(Cart item) async {
    List<Cart> cart = await getCart();
    cart.add(item);
    await saveCart(cart);
  }

  Future<void> removeFromCart(int itemId) async {
    List<Cart> cart = await getCart();
    cart.removeWhere((item) => item.id == itemId);
    await saveCart(cart);
  }
}
