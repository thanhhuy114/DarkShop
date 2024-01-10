import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../search_products_presenter.dart';

class SearchBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchBar({Key? key, required this.txt}) : super(key: key);

  final String txt;

  @override
  SearchBarState createState() => SearchBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SearchBarState extends State<SearchBar> {
  late TextEditingController txtController;

  @override
  void initState() {
    super.initState();
    txtController = TextEditingController(text: widget.txt);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TextField(
        controller: txtController,
        decoration: InputDecoration(
          hintText: Constants.search,
          suffixIcon: IconButton(
            onPressed: () {
              SearchProductsPresenter.getListProductsByKey(
                txtController.text,
                () {
                  setState(() {});
                },
              );
            },
            icon: const Icon(Icons.search_rounded),
          ),
        ),
        onChanged: (value) {},
      ),
      centerTitle: true,
      backgroundColor: MyColors.backgroundAppBar,
    );
  }
}
