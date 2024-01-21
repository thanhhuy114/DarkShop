import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/search/search_products_presenter.dart';
import 'package:flutter/material.dart';

class SearchSuggestions extends StatelessWidget {
  const SearchSuggestions({super.key, required this.presenter});
  final SearchProductsPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < presenter.suggestions.length; i++)
          Padding(
            padding: const EdgeInsets.all(1),
            child: GestureDetector(
              onTap: presenter.onClickSuggestion(presenter.suggestions[i]),
              child: Container(
                height: 23,
                width: MediaQuery.of(context).size.width,
                color: MyColors.backgroundSearchSuggestions,
                child: Text(
                  presenter.suggestions[i],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
