import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/search/components/button_sort.dart';
import 'package:flutter/material.dart';

class MenuSort extends StatelessWidget {
  const MenuSort(
      {super.key,
      required this.seletedIndex,
      required this.updateSeletedIndex});
  final int seletedIndex;
  final Function(int) updateSeletedIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonSort(
            title: Constants.related,
            seleted: seletedIndex == Constants.indexRelatedProducts,
            isUp: null,
            updateSeletedIndex: () {
              updateSeletedIndex(Constants.indexRelatedProducts);
            }),
        ButtonSort(
            title: Constants.latest,
            seleted: seletedIndex == Constants.indexLatestProducts,
            isUp: null,
            updateSeletedIndex: () {
              updateSeletedIndex(Constants.indexLatestProducts);
            }),
        ButtonSort(
            title: Constants.price,
            seleted: seletedIndex == Constants.indexPriceIncreaseProducts ||
                seletedIndex == Constants.indexPriceDecreaseProducts,
            isUp: seletedIndex == Constants.indexPriceIncreaseProducts,
            updateSeletedIndex: () {
              updateSeletedIndex(
                  seletedIndex != Constants.indexPriceIncreaseProducts
                      ? Constants.indexPriceIncreaseProducts
                      : Constants.indexPriceDecreaseProducts);
            }),
      ],
    );
  }
}
