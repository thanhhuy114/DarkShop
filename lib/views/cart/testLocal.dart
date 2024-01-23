// import 'package:darkshop/data/models/cart.dart';
// import 'package:darkshop/data/models/cart_custom.dart';
// import 'package:darkshop/data/models/cart_local.dart';
// import 'package:darkshop/data/repositories/cart_repository.dart';
// import 'package:darkshop/views/cart/cart_presenter.dart';
// import 'package:flutter/material.dart';

// class testLocal extends StatefulWidget {
//   @override
//   _testLocalState createState() => _testLocalState();
// }

// class _testLocalState extends State<testLocal> {
//   final CartPresenter cartService = CartPresenter(CartRepository());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Kiểm tra lưu trữ local'),
//       ),
//       body: FutureBuilder<List<CartCustom>>(
//         future: cartService.fetchCartListLocal(1),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('Đã xảy ra lỗi: ${snapshot.error}');
//           } else {
//             List<Cart> localCart = snapshot.data [];
//             // Hiển thị dữ liệu giỏ hàng từ local
//             return ListView.builder(
//               itemCount: localCart.length,
//               itemBuilder: (context, index) {
//                 Cart item = localCart[index];
//                 return ListTile(
//                   title: Text(
//                       'ID Sản phẩm: ${item.idProduct}, Số lượng: ${item.count}'),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
