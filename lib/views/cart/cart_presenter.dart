import 'dart:ffi';

import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/models/cart_custom.dart';
import 'package:darkshop/data/repositories/repository.dart';

class CartPresenter {
  final Repository _repository;
  CartPresenter(this._repository);

  //get listcart
  Future<List<CartCustom>> fetchCartList(int id_user) async {
    return _repository.getCardList(id_user);
  }

  //getlocal
  Future<List<CartCustom>> fetchCartListLocal(int id_user) async {
    return _repository.getLocal(id_user);
  }

  //add
  Future<void> postCartItem(Cart carts) async {
    await _repository.postCart(carts);
  }

//getcartId
  Future<Cart> getCartId(int id) async {
    return _repository.getCart(id);
  }

//Delete id
  Future<void> deleteCart(int id) async {
    await _repository.deteleCart(id);
  }

//Update cart
  Future<Cart> updateCart(Cart cart) async {
    return _repository.putCart(cart);
  }
}
