import 'package:darkshop/views/invoices/components/order/list_order_ad.dart';
import 'package:darkshop/views/invoices/components/widget/task_menu.dart';
import 'package:darkshop/views/invoices/components/widget/title.dart';
import 'package:flutter/material.dart';

class OMUser extends StatelessWidget {
  const OMUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        title: const TitleOM(),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: const [TaskMenu(), ListOrderUser()],
        ),
      ),
    );
  }
}
