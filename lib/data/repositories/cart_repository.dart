import 'dart:convert';

import 'package:darkshop/data/repositories/repository.dart';
import 'package:flutter/src/material/card.dart';
import '../models/cart.dart';
import 'package:http/http.dart' as http;

import '../models/cart_local.dart';

class CartRepository implements Repository {
  String db = '''http://192.168.1.3:3000''';
  @override
  Future<String> deteleCart(Cart Carts) {
    throw UnimplementedError();
  }

  @override
  Future<List<Cart>> getCardList(int id_user) async {
    List<Cart> cartList = [];
    var url = Uri.parse('$db/cart/all/$id_user');
    var repose = await http.get(url);
    print('Trang thai :${repose.statusCode}');
    var body = jsonDecode(repose.body.toString());
    for (var i = 0; i < body.length; i++) {
      cartList.add(Cart.fromJson(body[i]));
    }
    return cartList;
  }

  @override
  Future<String> postCart(Cart Cart) {
    // TODO: implement postCart
    throw UnimplementedError();
  }

  @override
  Future<String> pullCart(Cart Cart) {
    // TODO: implement pullCart
    throw UnimplementedError();
  }

  @override
  Future<List<Cart>> getLocal(int idUser) async {
    List<Cart> cartData = await getCardList(idUser);
    CartService cartService = CartService();
    await cartService.saveCart(cartData);
    return cartData;
  }
}
