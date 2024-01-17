import '../../utils/constants.dart';
import '../models/notification.dart';

class NotificationRepository {
  List<NotificationInfo> getAllNotifications() {
    return [
      NotificationInfo(
          date: DateTime.now(),
          type: 1,
          idObject: 1,
          description: "description description description description description description description description description description ",
          read: false),
      NotificationInfo(
          date: DateTime.now(),
          type: 1,
          idObject: 1,
          description: "description description description description description description description ",
          read: true),
    ];
  }

  NotificationInfo getNotificationById(int idNotification) {
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

  String getNotificationTitle(int type) {
    return Constants.notificationTypes[type] ?? "Không tìm thấy title";
  }

  readNotification(int id) async {
    //cập nhật thuộc tính read = true
  }
}
