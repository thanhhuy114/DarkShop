import 'package:darkshop/data/models/cart_custom.dart';
import 'package:darkshop/data/repositories/Cart_repository.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/cart/cart_presenter.dart';
import 'package:darkshop/views/cart/components/cart_item.dart';
import 'package:darkshop/views/cart/components/cart_total.dart';
import 'package:darkshop/views/productDetail/product_presenter.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final int id_user;

  const CartScreen({Key? key, required this.id_user}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartsRepository = CartPresenter(CartRepository());
  double totalPrice = 0.0;
  List<CartCustom> selectedCarts = [];

  @override
  void initState() {
    super.initState();
    fetchCartList();
  }

  Future<void> fetchCartList() async {
    try {
      var carts = await cartsRepository.fetchCartListLocal(widget.id_user);
      var listCarts = await cartsRepository.fetchCartListLocal(widget.id_user);
      setState(() {
        // Tính tổng giá tiền cho danh sách đã chọn
        totalPrice = selectedCarts
            .map<double>((cart) =>
                (cart.price - (cart.price * cart.promotion / 100)) * cart.count)
            .fold<double>(0.0, (acc, price) => acc + price);
        selectedCarts = List.from(listCarts); // Tạo một danh sách mới
      });
    } catch (error) {
      print('Lỗi: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsIconTheme: const IconThemeData(size: 40),
        title: const Text(
          'Giỏ hàng',
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 203, 66, 107),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: selectedCarts.length,
              itemBuilder: (context, index) {
                var cart = selectedCarts[index];
                return ItemCart(
                  key: ValueKey(cart
                      .id), // Key để giúp Flutter xác định sự thay đổi của ItemCart
                  Name: cart.name,
                  Price: cart.price,
                  ImagePro: cart.image,
                  Count: cart.count,
                  Promotion: cart.promotion,
                  onCheck: (bool value) {
                    setState(() {
                      List<CartCustom> updatedCarts = List.from(selectedCarts);

                      if (value) {
                        updatedCarts.add(cart);
                      } else {
                        updatedCarts.remove(cart);
                      }

                      // Tính tổng giá tiền cho danh sách đã chọn
                      totalPrice = updatedCarts
                          .map<double>((cart) =>
                              (cart.price -
                                  (cart.price * (cart.promotion / 100))) *
                              cart.count)
                          .fold<double>(0.0, (acc, price) => acc + price);

                      selectedCarts = updatedCarts;
                    });
                  },
                );
              },
            ),
          ),
          CartTotal(total: totalPrice),
        ],
      ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
