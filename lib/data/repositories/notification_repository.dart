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
        Uri.parse('${Constants.hosting}/notifications/$idUser'),
      );

      List<Map<String, dynamic>> jsonList =
          jsonDecode(response.body).cast<Map<String, dynamic>>();

      List<NotificationInfo> notifications = jsonList
          .map((notificationMap) => NotificationInfo.fromJson(notificationMap))
          .toList();

      // ignore: avoid_print
      print("Lấy danh sách thông báo ở sever thành công");

      NotificationLocal().saveNotifications(notifications);

      return notifications;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return [];
    }
  }

  addNotification(NotificationInfo newNotification) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.hosting}/notifications/add'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(newNotification.toJson()),
      );

      if (response.statusCode == 201) {
        // ignore: avoid_print
        print('Thêm mới thông báo thành công');
      } else {
        // ignore: avoid_print
        print('Lỗi khi thêm mới thông báo');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Lỗi: $e');
    }
  }

  Future<void> updateNotification(int notificationId) async {
    try {
      var response = await http.put(
        Uri.parse(
            '${Constants.hosting}/notifications/update/$notificationId'),
      );

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print('Cập nhật thông báo thành Đã đọc');
      } else {
        // ignore: avoid_print
        print('Cập nhật thông báo thất bại, mã lỗi: ${response.statusCode}');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Lỗi khi gọi API cập nhật thông báo: $e');
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
    await updateNotification(id);
  }
}

class NotificationLocal {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    File file = File('$path/notifications.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<String> getStringJson() async {
    String s = "";
    try {
      final localFile = await _localFile;
      s = await localFile.readAsString();
    } catch (e) {
      // ignore: avoid_print
      print("getStringJsonNotifications() error: $e");
    }
    return s;
  }

  Future<List<Map<String, dynamic>>> getListMap() async {
    String json = await getStringJson();
    List<Map<String, dynamic>> list = [];
    try {
      list = jsonDecode(json).cast<Map<String, dynamic>>();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }

    return list;
  }

  Future<List<NotificationInfo>> getAllNotifications() async {
    List<Map<String, dynamic>> listMap = await getListMap();
    List<NotificationInfo> results = [];

    try {
      results = listMap.map((map) => NotificationInfo.fromJson(map)).toList();
      // ignore: avoid_print
      print("Lấy danh sách thông bào từ local thành công");
      return results;
    } catch (e) {
      // ignore: avoid_print
      print("Lấy danh sách thông bào từ local thất bại");
      // ignore: avoid_print
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
      // ignore: avoid_print
      print("Lưu danh sách thông báo ở local thành công");
    } catch (e) {
      // ignore: avoid_print
      print("Lưu danh sách thông báo ở local thất bại");
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> clearNotifications() async {
    try {
      final file = await _localFile;

      await file.writeAsString('');

      // ignore: avoid_print
      print("Xóa danh sách thông báo ở local thành công");
    } catch (e) {
      // ignore: avoid_print
      print("Xóa danh sách thông báo ở local thất bại");
      // ignore: avoid_print
      print(e);
    }
  }
}
