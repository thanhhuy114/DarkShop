import 'package:darkshop/data/models/product.dart';

class SearchProductsRepository{
  static List<Product> getListProductsByKey(String key){
    return [];
  }
  
  static List<Product> getListProductsByType(int idType){
    return [];
  }

  static List<Product> sortListProductsByPrice(List<Product> products, bool isIncrease){
    return [];
  }

  static List<Product> sortListProductsByDate(List<Product> products, bool isNew){
    return [];
  }
}