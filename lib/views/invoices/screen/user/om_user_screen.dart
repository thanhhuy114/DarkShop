import 'package:darkshop/views/invoices/components/order/list_order_ad.dart';
import 'package:darkshop/views/invoices/screen/task_menu.dart';
import 'package:darkshop/views/invoices/screen/title.dart';
import 'package:flutter/material.dart';

class OMUser extends StatelessWidget {
  const OMUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 185, 88),
      appBar: AppBar(
        title: const TitleOM(),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: const Column(
          children: [
            TaskMenu(),
            SizedBox(
              height: 5,
            ),
            ListOrderUser()
          ],
        ),
      ),
    );
  }
}