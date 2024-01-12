<<<<<<< HEAD
import 'package:darkshop/views/productManagement/addProduct_screen.dart';
import 'package:darkshop/views/productManagement/editProduct_screen.dart';
import 'package:darkshop/views/productManagement/proMgmt_screen.dart';
=======
import 'package:darkshop/views/search/search_products_screen.dart';
>>>>>>> acc8e9396b42b0d36a2fe32b2b39f303f164958a
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const EditProScreen(),
      },
    );
  }
}
=======
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
>>>>>>> acc8e9396b42b0d36a2fe32b2b39f303f164958a
