//giao diện tài khoản
import 'package:darkshop/views/cart/components/cart_item.dart';
import 'package:darkshop/views/cart/components/cart_total.dart';
import 'package:flutter/material.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [Icon(Icons.delete)],
        actionsIconTheme: const IconThemeData(size: 40),
        title: const Text(
          'Giỏ hàng',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 203, 66, 107),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            itemCart(
                productId: 0,
                count: 1,
                name:
                    'Laptop Asus TUF Gaming FX506HF-HN017W i5 11400H/16GB/512GB/GeForce RTX 2050 4GB/Win11',
                price: '17,990,000'),
            itemCart(
                productId: 0,
                count: 1,
                name:
                    'Laptop Asus TUF Gaming FX506HF-HN017W i5 11400H/16GB/512GB/GeForce RTX 2050 4GB/Win11',
                price: '17,990,000'),
            itemCart(
                productId: 0,
                count: 1,
                name:
                    'Laptop Asus TUF Gaming FX506HF-HN017W i5 11400H/16GB/512GB/GeForce RTX 2050 4GB/Win11',
                price: '17,990,000'),
            itemCart(
                productId: 0,
                count: 1,
                name:
                    'Laptop Asus TUF Gaming FX506HF-HN017W i5 11400H/16GB/512GB/GeForce RTX 2050 4GB/Win11',
                price: '17,990,000'),
          ],
        ),
      ),
      bottomSheet: cartTotal(total: 0),
    );
  }
}
