import '../../utils/constants.dart';
import '../models/notification.dart';

class NotificationRepository {
  Future<List<NotificationInfo>> getAllNotifications() async {
    return [
      NotificationInfo(
          date: DateTime.now(),
          type: Constants.notificationTypes[Constants.datHangThanhCong],
          idObject: 1,
          description: "description description description description description description description description description description description description description description description description description ",
          read: false),
      NotificationInfo(
          date: DateTime.now(),
          type: Constants.notificationTypes[Constants.donHangDaHuy],
          idObject: 1,
          description: "description description description description description description description ",
          read: true),
    ];
  }

  Future<NotificationInfo> getNotificationById(int idNotification) async {
    return NotificationInfo.empty();
  }

  String getNotificationTime(DateTime dateTime) {
    DateTime now = DateTime.now();
    Duration difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Bây giờ';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} giờ trước';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}';
    }
  }

  readNotification(int id) async {
    //cập nhật thuộc tính read = true
  }
}
