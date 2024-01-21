import 'package:flutter/material.dart';
import 'package:darkshop/data/models/product.dart';
import 'package:darkshop/views/cart/components/count_product.dart';

class ItemCart extends StatefulWidget {
  final Future<Product>? product;
  final int? count;

  ItemCart({
    Key? key,
    required this.product,
    required this.count,
  }) : super(key: key);

  @override
  State<ItemCart> createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  bool isChecked = false; // Cho checkbox đơn lựa chọn

  @override
  Widget build(BuildContext context) {
    var url =
        '''https://res.cloudinary.com/dvrzyngox/image/upload/v1705543245/''';
    return FutureBuilder(
      future: widget.product,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Lỗi: ${snapshot.error}');
        } else if (!snapshot.hasData) {
          return const Text('Không có dữ liệu');
        } else {
          Product product = snapshot.data as Product;

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
                    url + product.image.toString(),
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
                          product.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          ((product.price -
                                      (product.price *
                                          product.promotion /
                                          100)) *
                                  widget.count!)
                              .toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Flexible(child: CountProduct(count: widget.count!)),
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
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
      },
    );
  }
}
