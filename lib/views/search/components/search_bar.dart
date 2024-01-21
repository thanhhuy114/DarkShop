import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../search_products_presenter.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({Key? key, required this.presenter}) : super(key: key);
  final SearchProductsPresenter presenter;

  @override
  SearchBarState createState() => SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        height: 30,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: TextField(
          controller: widget.presenter.txtSearch,
          decoration: InputDecoration(
            hintText: Constants.search,
            suffixIcon: IconButton(padding: const EdgeInsets.only(),
              onPressed: widget.presenter.exitSearch,
              icon: const Icon(Icons.cancel),
            ),
          ),
          onChanged: (value) {
            widget.presenter.getSuggestionsByKey();
          },
          onTap: widget.presenter.onClickSearchTextField,
        ),
      ),
      centerTitle: true,
      backgroundColor: MyColors.backgroundAppBar,
    );
  }
}
