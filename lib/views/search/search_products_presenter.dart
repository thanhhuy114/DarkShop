import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/repositories/search_products_repository.dart';

class SearchProductsPresenter {
  static List<Product> products = [];

  getListProductsByKey(String key, Function callback) {
    SearchProductsRepository.getListProductsByKey(key)
        .then((value) => {products = value, callback});
  }

  getListProductsByType(
      int idType, Function callback) {
    SearchProductsRepository.getListProductsByType(idType)
        .then((value) => {products = value, callback});
  }

  List<Product> sortListProductsByPrice(bool isIncrease) {
    return [];
  }

  List<Product> sortListLatesProducts() {
    return [];
  }
}
