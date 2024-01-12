import 'package:darkshop/views/search/components/product_card.dart';
import 'package:darkshop/views/search/search_products_presenter.dart';
import 'package:flutter/material.dart';

class ListProducts extends StatefulWidget {
  const ListProducts({super.key, required this.presenter});
  final SearchProductsPresenter presenter;

  @override
  State<ListProducts> createState() => _ListProductsState();
}

class _ListProductsState extends State<ListProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < widget.presenter.products.length; i++)
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: ProductCard(product: widget.presenter.products[i]),
          )
      ],
    );
  }
}
