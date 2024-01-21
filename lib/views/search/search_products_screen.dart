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

    SearchProductsPresenter.getSuggestions().then((value) {
      presenter = SearchProductsPresenter(
          suggestions: value, reload: () => setState(() {}));
    });
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
    return Container();

    // return Scaffold(
    //   // appBar: const SearchBar(
    //   //   // txt: "",
    //   // ),
    //   body: Padding(
    //     padding:  EdgeInsets.all(5.0),
    //     child: Column(children: [
    //       MenuSort(
    //         seletedIndex: seletedIndex,
    //         updateSeletedIndex: (newIndex) {
    //           setState(() {
    //             seletedIndex = newIndex;
    //           });
    //         },
    //       ),
    //       const ListProducts()
    //     ]),
    //   ),
    //   backgroundColor: MyColors.backgroundApp,
    // );
  }
}
