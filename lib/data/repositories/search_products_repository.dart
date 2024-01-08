import 'package:darkshop/data/models/product.dart';

class SearchProductsRepository {
  static Future<List<Product>> getListProductsByKey(String key) async {
    return [
      Product(
          id: 0,
          idType: 2,
          image: null,
          imageInfo: null,
          name: "Sản phẩm siêu cấp vip pro",
          description: "description",
          price: 1111111,
          promotion: 0,
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
  }

  static Future<List<Product>> getListProductsByType(int idType) async {
    return [];
  }
}
