import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/search/components/list_products.dart';
import 'package:darkshop/views/search/components/search_bar.dart';
import 'package:darkshop/views/search/search_products_presenter.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'components/menu_sort.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  int seletedIndex = 0;
  List<Product> products = [];

  @override
  void initState() {
    super.initState();

    SearchProductsPresenter.getListProductsByKey("", () {
      products = SearchProductsPresenter.products;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SearchBar(
        txt: "",
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(children: [
          MenuSort(
            seletedIndex: seletedIndex,
            updateSeletedIndex: (newIndex) {
              setState(() {
                seletedIndex = newIndex;
              });
            },
          ),
          const ListProducts()
        ]),
      ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
