import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/models/cart_custom.dart';

abstract class Repository {
  //GET ID USER
  Future<List<CartCustom>> getCardList(int id_user);
  //PULL
  Future<Cart> putCart(Cart Cart);
  //DELETE
  Future<void> deteleCart(int id_cart);
  //POST
  Future<void> postCart(Cart Cart);
  //GET ID CART
  Future<Cart> getCart(int id);
  //LOCAL
  Future<List<CartCustom>> getLocal(int id_user);
}
