import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/data/repositories/notification_repository.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:flutter/material.dart';

class NotificationPresenter {
  NotificationPresenter({required this.reload, required this.notifications});
  Function reload;
  List<NotificationInfo> notifications;
  static bool connected = false;

  //tính thời gian thông báo của 1 thông báo
  String getNotificationTime(DateTime dateTime) {
    return NotificationRepository().getNotificationTime(dateTime);
  }

  static Future<List<NotificationInfo>> loadNotifications(int idUser) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      connected = true;
      return await NotificationRepository().getAllNotifications(idUser);
    } else {
      return NotificationLocal().getAllNotifications();
    }
  }

  onclickCard(NotificationInfo notification, BuildContext context) async {
    if (connected) {
      if (!notification.read) {
        await NotificationRepository().readNotification(notification.id);
        notifications = await loadNotifications(GlobalData.user!.id);
        reload();
        //chuyển dến chi tiết
      }
    }
  }

  static addNotification(NotificationInfo newNotification) async {
    await NotificationRepository().addNotification(newNotification);
  }
}
