import 'package:darkshop/utils/screen_size.dart';
import 'package:darkshop/views/account/account_screen.dart';
import 'package:darkshop/views/cart/cart_screen.dart';
import 'package:darkshop/views/home/home_screen.dart';
import 'package:darkshop/views/invoices/screen/user/om_user_screen.dart';
import 'package:darkshop/views/notification/notification_screen.dart';
import 'package:flutter/material.dart';

class NavigationHomePage extends StatefulWidget {
  const NavigationHomePage({super.key});

  @override
  State<NavigationHomePage> createState() => _NavigationHomePageState();
}

class _NavigationHomePageState extends State<NavigationHomePage> {
  final PageController _controller = PageController();

  int _currentIndex = 0;

  onTap(int index) {
    // if (!GlobalData.isLogin!) {
    //   Navigator.of(context).push(createRoutePushThrough(
    //       screen: const LoginScreen()));
    //   return;
    // }
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  List<Widget> _buildThreePageViewChildren() {
    return <Widget>[
      const HomeScreen(),
      const cartScreen(),
      const NotificationScreen(),
      const OMUser(),
      const AccountScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onTap,
        children: _buildThreePageViewChildren(),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: screenWidth * 0.05,
          elevation: 10,
          selectedItemColor: const Color.fromARGB(255, 203, 66, 107),
          unselectedItemColor: Colors.black,
          selectedFontSize: screenWidth * 0.032,
          unselectedFontSize: screenWidth * 0.03,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) {
            _controller.jumpToPage(index);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Trang chủ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Giỏ hàng"),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: "Thông báo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment), label: "Đơn hàng"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outlined), label: "Tài khoản")
          ]),
    );
  }
}
