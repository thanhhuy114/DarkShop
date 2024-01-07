import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/views/notification/components/list_notifications.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Thông báo"), centerTitle: true, backgroundColor: MyColors.backgroundAppBar,),
      body: const ListNotifications(),
      backgroundColor: MyColors.background,
    );
  }
}