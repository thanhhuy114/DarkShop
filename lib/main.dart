import 'package:darkshop/views/search/search_products_screen.dart';
import 'package:darkshop/views/stunning_splash_screen/splash_screen.dart';
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
      home: const SplashScreen(
        homeScreen: SearchProductsScreen(),
      ),
    );
  }
}
