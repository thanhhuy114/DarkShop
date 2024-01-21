import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/data/models/search_history.dart';
import 'package:darkshop/data/repositories/search_history_repository.dart';
import 'package:darkshop/data/repositories/search_products_repository.dart';
import 'package:flutter/material.dart';

class SearchProductsPresenter {
  SearchProductsPresenter({required this.reload}) {
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
  }

  TextEditingController txtSearch = TextEditingController();
  bool isSearch = false;
  List<String> suggestions = [];
  List<String> suggestionsByKey = [];
  List<Product> products = [];
  int seletedIndex = 0;
  Function reload;

  getSuggestions() {
    SearchProductsRepository().getSearchHistory().then((value) {
      suggestions = value;
      reload();
    });
    SearchProductsRepository().getListProductTypes().then((value) {
      suggestions += value;
      reload();
    });

    return suggestions;
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

  exitSearch() {
    isSearch = false;
    txtSearch.text = "";
    reload();
  }

  onClickSuggestion(String key) {
    isSearch = true;
    reload();
  }

  getListProductsByKey(String key) {
    SearchProductsRepository().getListProductsByKey(key).then((value) {
      products = value;
      reload();
    });
  }

  //lấy danh sách sản phẩm theo loại
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

  getSearchHistories() async {
    List<SearchHistory> searchHistorys =
        await SearchHistoryRepository().getListSearchHistories();
    return searchHistorys;
  }

  //lấy danh sách loại sản phẩm
  Future<List<String>> getListProductTypes() async {
    return await SearchProductsRepository().getListProductTypes();
  }
}
