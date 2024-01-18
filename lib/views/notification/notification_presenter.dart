import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/data/repositories/notification_repository.dart';
import 'package:flutter/material.dart';

class NotificationPresenter {
  NotificationPresenter({required this.reload, required this.notifications});
  Function reload;
  List<NotificationInfo> notifications;

  //tính thời gian thông báo của 1 thông báo
  String getNotificationTime(DateTime dateTime) {
    return NotificationRepository().getNotificationTime(dateTime);
  }

  //lấy danh sách thông báo
  static Future<List<NotificationInfo>> loadNotifications() async {
    return await NotificationRepository().getAllNotifications();
  }

  //lấy thông báo bằng id
  onclickCard(int idObject, BuildContext context) {
    NotificationRepository().readNotification(idObject);
    reload();
  }
}
