import 'package:darkshop/views/cart/cart_screen.dart';
import 'package:darkshop/views/productDetail/productInfo_screen.dart';
import 'package:darkshop/views/productDetail/product_screen.dart';
import 'package:darkshop/views/productDetail/productimgzoom_screen.dart';
import 'package:darkshop/views/productManagement/addProduct_screen.dart';
import 'package:darkshop/views/productManagement/proMgmt_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => addProSCreen(),
      },
    );
  }
}
