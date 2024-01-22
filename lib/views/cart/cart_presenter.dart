import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/repositories/repository.dart';

class CartPresenter {
  final Repository _repository;
  CartPresenter(this._repository);

  //get
  Future<List<Cart>> fetchCartList(int id_user) async {
    return _repository.getCardList(id_user);
  }

  Future<List<Cart>> fetchCartListLocal(int id_user) async {
    return _repository.getLocal(id_user);
  }
}
