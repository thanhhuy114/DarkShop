import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/notification/components/list_notifications.dart';
import 'package:darkshop/views/notification/components/request_login.dart';
import 'package:darkshop/views/notification/notification_presenter.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  NotificationPresenter? presenter;

  @override
  void initState() {
    super.initState();

    if (GlobalData.user != null) {
      NotificationPresenter.loadNotifications(GlobalData.user!.id)
          .then((value) {
        presenter = NotificationPresenter(
            reload: () => setState(() {}), notifications: value);

        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.notification),
        centerTitle: true,
        backgroundColor: MyColors.backgroundAppBar,
      ),
      body: GlobalData.user == null
          ? const RequestLogin()
          : presenter != null
              ? ListNotifications(presenter: presenter!)
              : Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 232, 187, 187),
                    Color.fromARGB(255, 239, 186, 11)
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.logo,
                        width: 150,
                        height: 150,
                      )
                    ],
                  ),
                ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
