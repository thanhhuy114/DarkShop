import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/data/repositories/notification_repository.dart';
import 'package:flutter/material.dart';

class NotificationPresenter {
  //tính thời gian thông báo của 1 thông báo
  String getNotificationTime(DateTime dateTime) {
    return NotificationRepository().getNotificationTime(dateTime);
  }

  //lấy tiêu đề thông báo
  String getNotificationTitle(int type) {
    return NotificationRepository().getNotificationTitle(type);
  }

  //lấy danh sách thông báo
  List<NotificationInfo>? loadNotifications() {
    return NotificationRepository().getAllNotifications();
  }

  //lấy thông báo bằng id
  onclickCard(int idObject, int idType, BuildContext context) {
    NotificationRepository().readNotification(idObject);

    //chuyển đến chi tiết thông báo theo loại thông báo (sản phầm / đơn hàng)
    switch (idType) {
      case 1:
        
        break;
      case 2:
        
        break;
      case 3:
        
        break;
      case 4:
        
        break;
    }
  }
}
