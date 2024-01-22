import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/cart/components/count_product.dart';

class ItemCart extends StatefulWidget {
  final String Name;
  final int Price;
  final String ImagePro;
  final int Promotion;
  int Count;
  final Function(double)? onPriceChanged;
  final void Function(bool isChecked)? onCheck;

  ItemCart({
    Key? key,
    required this.onCheck,
    required this.Name,
    required this.Price,
    required this.ImagePro,
    required this.Count,
    required this.Promotion,
    this.onPriceChanged,
  }) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 203, 66, 107),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              (urlImage + widget.ImagePro).toString(),
              cacheHeight: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.Name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    formatCurrency(calculateTotalPrice()),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Flexible(child: CountProduct(count: widget.Count)),
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                      widget.onCheck?.call(value!);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateTotalPrice() {
    return (widget.Price - (widget.Price * (widget.Promotion / 100)).toInt()) *
        widget.Count;
  }
}
