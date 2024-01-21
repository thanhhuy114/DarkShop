import 'package:darkshop/views/search/components/list_products.dart';
// import 'package:darkshop/views/search/components/search_bar.dart';
import 'package:darkshop/views/search/components/search_suggestion.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/search/components/menu_sort.dart';
import 'package:darkshop/views/search/search_products_presenter.dart';
import 'package:flutter/material.dart';

class SearchProductsScreen extends StatefulWidget {
  const SearchProductsScreen({super.key});

  @override
  State<SearchProductsScreen> createState() => _SearchProductsScreenState();
}

class _SearchProductsScreenState extends State<SearchProductsScreen> {
  SearchProductsPresenter? presenter;

  @override
  void initState() {
    super.initState();

    presenter = SearchProductsPresenter(reload: () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    if (presenter != null) {
      return Scaffold(
        // appBar: SearchBar(presenter: presenter!),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView(
            children: [
              if (!presenter!.isSearch)
                MenuSort(
                  seletedIndex: presenter!.seletedIndex,
                  updateSeletedIndex: (newIndex) {
                    setState(() {
                      presenter!.seletedIndex = newIndex;
                    });
                  },
                ),
              presenter!.isSearch
                  ? SearchSuggestions(
                      presenter: presenter!,
                    )
                  : ListProducts(
                      presenter: presenter!,
                    )
            ],
          ),
        ),
        backgroundColor: MyColors.backgroundApp,
      );
    }
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 232, 187, 187),
        Color.fromARGB(255, 239, 186, 11)
      ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 150,
            height: 150,
          )
        ],
      ),
    );
  }
}
