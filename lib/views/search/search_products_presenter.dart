import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/repositories/search_products_repository.dart';
import 'package:flutter/material.dart';

class SearchProductsPresenter {
  SearchProductsPresenter({required this.suggestions, required this.reload}) {
    // getSuggestions(String key)
    products = [
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
    reload();
    getListProductTypes();
  }

  TextEditingController txtSearch = TextEditingController();
  bool isSearch = false;
  List<String> suggestions;
  List<String> suggestionsByKey = [];
  List<String> productTypes = [];
  List<Product> products = [];
  int seletedIndex = 0;
  Function reload;

  static Future<List<String>> getSuggestions() async {
    return await SearchProductsRepository().getSuggestions();
  }

  getSuggestionsByKey() {
    if (txtSearch.text.isNotEmpty) {
      suggestionsByKey = suggestions
          .where((suggestion) =>
              suggestion.toLowerCase().contains(txtSearch.text.toLowerCase()))
          .toList();
      reload();
    }
  }

  onClickSearchTextField() {
    isSearch = true;
    reload();
  }

  getListProductsByKey(String key) {
    SearchProductsRepository().getListProductsByKey(key).then((value) {
      products = value;
      reload();
    });
  }

  getListProductTypes(){
    SearchProductsRepository().getListProductTypes().then((value) {
      productTypes = value;
      reload();
    });
  }

  getListProductsByType(String type) {
    SearchProductsRepository().getListProductsByType(type).then((value) {
      products = value;
      reload();
    });
  }

  List<Product> sortListProductsByPrice(bool isIncrease) {
    return [];
  }

  List<Product> sortListLatesProducts() {
    return [];
  }
}
