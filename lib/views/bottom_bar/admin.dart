import 'package:flutter/material.dart';

class BottomBarAdmin extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomBarAdmin({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        selectedItemColor: const Color.fromARGB(255, 7, 134, 239),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Color.fromARGB(255, 7, 134, 239),
              ),
              label: 'Trang chủ'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications_active,
                color: Color.fromARGB(255, 7, 134, 239),
              ),
              label: 'Thông báo'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_checkout,
                color: Color.fromARGB(255, 7, 134, 239),
              ),
              label: 'Cá nhân'),
        ],
      ),
    );
  }
}
