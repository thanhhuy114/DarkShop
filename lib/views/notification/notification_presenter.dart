import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/data/repositories/notification_repository.dart';
import 'package:darkshop/views/account/account_presenter.dart';
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
  static Future<List<NotificationInfo>> loadNotifications(int idUser) async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult != ConnectivityResult.none) {
      return await NotificationRepository().getAllNotifications(idUser);
    } else {
      return NotificationLocal().getAllNotifications();
    }
  }

  //lấy thông báo bằng id
  onclickCard(NotificationInfo notification, BuildContext context) {
    Connectivity().checkConnectivity().then((value) {
      if (value != ConnectivityResult.none) {
        if (!notification.read) {
          NotificationRepository()
              .readNotification(notification.id)
              .then((value) {
            loadNotifications(AccountPresenter.userLogin!.id).then((value) {
              reload();
            });
          });

          //chuyển dến chi tiết
        }
      }
    });
  }

  addNotification() {}
}
