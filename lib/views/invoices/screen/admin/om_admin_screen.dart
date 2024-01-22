// import 'package:darkshop/data/repositories/invoice_repository.dart';
import 'package:darkshop/views/invoices/components/order/list_order_a.dart';
import 'package:darkshop/views/invoices/components/order/list_order_u.dart';
import 'package:darkshop/views/invoices/components/widget/task_menu.dart';
import 'package:darkshop/views/invoices/components/widget/title.dart';
import 'package:flutter/material.dart';

class OMAdmin extends StatefulWidget {
  const OMAdmin({Key? key}) : super(key: key);

  @override
  OMAdminState createState() => OMAdminState();
}

class OMAdminState extends State<OMAdmin> {
  int desiredStatus = 1;

  void updateDesiredStatus(int status) {
    setState(() {
      desiredStatus = status;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 185, 88),
      appBar: AppBar(
        title: const TitleOM(),
      ),
      body: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TaskMenu(
              desiredStatus: desiredStatus,
              updateDesiredStatus: updateDesiredStatus,
            ),
            const SizedBox(
              height: 5,
            ),
            ListOrderAdmin(
              desiredStatus: desiredStatus,
            ),
          ],
        ),
      ),
    );
  }
}
