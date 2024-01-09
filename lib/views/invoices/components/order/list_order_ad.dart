// import 'package:darkshop/views/invoices/components/order_u.dart';
import 'package:darkshop/views/invoices/components/order/order_ad.dart';
import 'package:flutter/material.dart';

class ListOrderUser extends StatelessWidget {
  const ListOrderUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: const [OrderAd(), OrderAd(), OrderAd()],
      ),
    );
  }
}
