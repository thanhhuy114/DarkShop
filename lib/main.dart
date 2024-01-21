import 'package:darkshop/views/cart/cart_screen.dart';
import 'package:darkshop/views/productDetail/productInfo_screen.dart';
import 'package:darkshop/views/productDetail/product_screen.dart';
import 'package:darkshop/views/stunning_splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// Lưu trạng thái của ứng dụng
  static bool? isLogin;
  static bool? isAdmin;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DarkShop',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 255, 185, 88),
      )),
      debugShowCheckedModeBanner: false,
      home: CartScreen(id_user: 1),
    );
  }
}
