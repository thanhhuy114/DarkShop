import 'package:darkshop/views/bottom_bar/user.dart';
import 'package:darkshop/views/invoices/screen/admin/om_admin_screen.dart';
import 'package:darkshop/views/invoices/screen/user/om_user_screen.dart';
import 'package:darkshop/views/invoices/om_admin_screen.dart';
import 'package:darkshop/views/invoices/om_user_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  List<Widget> pages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: pages,
        ),
        bottomNavigationBar: BottomBarUser(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
