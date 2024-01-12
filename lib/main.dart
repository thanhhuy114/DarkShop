import 'package:darkshop/views/account/account_screen.dart';
import 'package:darkshop/views/search/components/search_bar.dart';
import 'package:darkshop/views/search/search_products_screen.dart';
import 'package:darkshop/views/users_management/users_management_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DarkShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/":(context) =>const SearchProductsScreen(),
      },
    );
  }
}