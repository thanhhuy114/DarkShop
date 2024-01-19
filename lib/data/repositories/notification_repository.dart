import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../utils/constants.dart';
import '../models/notification.dart';
import 'package:http/http.dart' as http;

class NotificationRepository {
  Future<List<NotificationInfo>> getAllNotifications(int idUser) async {
    try {
      var response = await http.get(
        Uri.parse('${Constants.hosting}:3000/notifications/'),
      );

      List<Map<String, dynamic>> jsonList =
          jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<NotificationInfo> notifications = jsonList
          .map((notificationMap) => NotificationInfo.fromJson(notificationMap))
          .toList();
      return notifications;
    } catch (e) {
      print(e);
      return [];
    }
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
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }

  readNotification(int id) async {
    //cập nhật thuộc tính read = true
  }
}

class NotificationLocal {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/notifications.json');
  }

  Future<String> getStringJson() async {
    File file = await _localFile;
    String jsonString = await file.readAsString();

    return jsonString;
  }

  Future<List<Map<String, dynamic>>> getListMap() async {
    String json = await getStringJson();

    List<Map<String, dynamic>> list =
        jsonDecode(json).cast<Map<String, dynamic>>();

    return list;
  }

  Future<List<NotificationInfo>> getAllNotifications() async {
    List<Map<String, dynamic>> listMap = await getListMap();
    List<NotificationInfo> results = [];

    try {
      results = listMap.map((map) => NotificationInfo.fromJson(map)).toList();
      return results;
    } catch (e) {
      print(e);
      return results;
    }
  }

  Future<void> saveNotifications(List<NotificationInfo> notifications) async {
    try {
      final file = await _localFile;

      final List<Map<String, dynamic>> notificationListMap =
          notifications.map((notification) => notification.toJson()).toList();

      final jsonString = json.encode(notificationListMap);

      await file.writeAsString(jsonString);
      print("Lưu danh sách thông báo ở local thành công");
    } catch (e) {
      print("Lưu danh sách thông báo ở local thất bại");
      print(e);
    }
  }
}
