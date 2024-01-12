import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/repositories/search_products_repository.dart';

class SearchProductsPresenter {
  static List<Product> products = [
    Product(
        id: 0,
        idType: 2,
        image: null,
        imageInfo: null,
        name: "Sản phẩm siêu cấp vip pro",
        description: "description",
        price: 1111111,
        promotion: 10,
        repository: 99,
        postAt: DateTime.now()),
    Product(
        id: 0,
        idType: 1,
        image: null,
        imageInfo: null,
        name: "Sản phẩm siêu cấp vip pro",
        description: "description",
        price: 1111111,
        promotion: 0,
        repository: 99,
        postAt: DateTime.now())
  ];

  static getListProductsByKey(String key, Function callback) {
    SearchProductsRepository.getListProductsByKey(key).then((value) {
      products = value;
      callback;
    });
  }

  static getListProductsByType(int idType, Function callback) {
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
