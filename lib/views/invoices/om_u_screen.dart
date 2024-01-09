// import 'package:darkshop/views/invoices/components/list_order_u.dart';
import 'package:darkshop/views/invoices/components/order_ad.dart';
import 'package:darkshop/views/invoices/components/task_menu.dart';
import 'package:flutter/material.dart';

class OMUser extends StatelessWidget {
  const OMUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 185, 88),
        appBar: null,
        body: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.only(bottom: 10),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.white,
                  ),
                  child: const Text(
                    'Quản lý đơn hàng',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const TaskMenu(),
                const SizedBox(
                  height: 5,
                ),
                const OrderAd()
              ],
            )));
  }
}
