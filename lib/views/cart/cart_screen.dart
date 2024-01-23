import 'package:darkshop/data/models/cart.dart';
import 'package:darkshop/data/models/cart_custom.dart';
import 'package:darkshop/data/models/cart_local.dart';

import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/cart/cart_presenter.dart';
import 'package:darkshop/views/cart/components/cart_item.dart';
import 'package:darkshop/views/cart/components/cart_total.dart';
import 'package:flutter/material.dart';

import '../../data/repositories/cart_repository.dart';

class CartScreen extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final int id_user;

  const CartScreen({Key? key, required this.id_user}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  var cartsRepository = CartPresenter(CartRepository());
  var cartService = CartService(); // Tạo đối tượng CartService
  double totalPrice = 0.0;
  List<CartCustom> selectedCarts = [];

  @override
  void initState() {
    super.initState();
    fetchCartList();
  }

  Future<void> fetchCartList() async {
    try {
      // Sử dụng CartService để lấy dữ liệu giỏ hàng
      var listCarts = await cartsRepository.fetchCartList(GlobalData.user!.id);

      setState(() {
        totalPrice = selectedCarts
            .map<double>((cart) =>
                (cart.price - (cart.price * cart.promotion / 100)) * cart.count)
            .fold<double>(0.0, (acc, price) => acc + price);
        selectedCarts = List.from(listCarts);
      });
    } catch (error) {
      print('Lỗi: $error');
    }
  }

  void saveCartToLocal(List<CartCustom> updatedCarts) async {
    // Sử dụng CartService để lưu dữ liệu giỏ hàng được cập nhật
    await cartService.saveCart(updatedCarts);
    print('Đã lưu giỏ hàng local');
  }

  Future<void> getCartFromLocal() async {
    // Sử dụng CartService để lấy dữ liệu giỏ hàng từ local
    var localCarts = await cartService.getCart();
    setState(() {
      selectedCarts = localCarts;
      totalPrice = localCarts
          .map<double>((cart) =>
              (cart.price - (cart.price * cart.promotion / 100)) * cart.count)
          .fold<double>(0.0, (acc, price) => acc + price);
    });
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
                  key: ValueKey(cart.id),
                  idProduct: cart.idProduct,
                  id_user: cart.idUser,
                  idcart: cart.id,
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

                      totalPrice = updatedCarts
                          .map<double>((cart) =>
                              (cart.price -
                                  (cart.price * (cart.promotion / 100))) *
                              cart.count)
                          .fold<double>(0.0, (acc, price) => acc + price);

                      // Lưu giỏ hàng vào local khi giỏ hàng thay đổi
                      saveCartToLocal(updatedCarts);

                      selectedCarts = updatedCarts;
                    });
                  },
                );
              },
            ),
          ),
          CartTotal(total: totalPrice)
        ],
      ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
