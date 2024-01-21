import 'package:darkshop/data/repositories/cart_repository.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/cart/cart_presenter.dart';
import 'package:darkshop/views/cart/components/cart_item.dart';
import 'package:darkshop/views/cart/components/cart_total.dart';
import 'package:darkshop/views/productDetail/product_presenter.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int id_user;

  CartScreen({Key? key, required this.id_user}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartsRepository = cartPresenter(cartRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.delete)],
        actionsIconTheme: IconThemeData(size: 40),
        title: const Text(
          'Giỏ hàng',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 203, 66, 107),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: cartsRepository.fetchCartList(widget.id_user),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Lỗi: ${snapshot.error}');
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(
                    child: Text('Không có mục nào trong giỏ hàng.'),
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var cart = snapshot.data?[index];
                      var product = ProductPresenter.getPro(cart!.idProduct);
                      return ItemCart(product: product, count: cart?.count);
                    },
                  );
                }
              },
            ),
          ),
          CartTotal(total: 0),
        ],
      ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
