import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/invoices/components/order/list_order_u.dart';
import 'package:darkshop/views/invoices/components/widget/task_menu.dart';
import 'package:darkshop/views/invoices/components/widget/title.dart';
import 'package:darkshop/views/notification/components/request_login.dart';
import 'package:darkshop/views/notification/notification_presenter.dart';
import 'package:flutter/material.dart';

class OMUser extends StatefulWidget {
  const OMUser({Key? key}) : super(key: key);

  @override
  OMUserState createState() => OMUserState();
}

class OMUserState extends State<OMUser> {
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
      body: GlobalData.user == null
          ? const RequestLogin()
          : Container(
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
                  ListOrderUser(
                    desiredStatus: desiredStatus,
                  ),
                ],
              ),
            ),
    );
  }
}
