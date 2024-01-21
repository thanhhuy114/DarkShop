import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/repositories/repository.dart';

class cartPresenter {
  final Repository _repository;
  cartPresenter(this._repository);

  //get
  Future<List<Cart>> fetchCartList(int id_user) async {
    return _repository.getCardList(id_user);
  }
}
