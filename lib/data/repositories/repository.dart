import 'package:darkshop/data/models/cart.dart';

abstract class Repository {
  //GET
  Future<List<Cart>> getCardList(int id_user);
  //PULL
  Future<String>pullCart(Cart Cart);
  //DELETE
  Future<String>deteleCart(Cart Cart);
  //POST
  Future<String>postCart(Cart Cart);
}
