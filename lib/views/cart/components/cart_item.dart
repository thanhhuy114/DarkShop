import 'package:darkshop/views/cart/components/count_product.dart';
import 'package:flutter/material.dart';

class itemCart extends StatefulWidget {
  final int productId;
  final int count;
  final String name;
  final String price;

  itemCart({
    Key? key,
    required this.productId,
    required this.count,
    required this.name,
    required this.price,
  }) : super(key: key);

  @override
  State<itemCart> createState() => _itemCartState();
}

class _itemCartState extends State<itemCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 4,
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 203, 66, 107),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://images.fpt.shop/unsafe/fit-in/960x640/filters:quality(90):fill(white):upscale()/fptshop.com.vn/Uploads/Originals/2022/4/20/637860593091364580_HASP-ASUS-FX506H-9.jpg',
                cacheHeight: 100,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Flexible(child: countProduct(count: widget.count)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
