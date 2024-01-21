import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/account/account_presenter.dart';

class NotificationInfo {
  int id;
  int idUser;
  DateTime date;
  String type;
  int idObject;
  String description;
  bool read;

  NotificationInfo({
    required this.id,
    required this.idUser,
    required this.date,
    required this.type,
    required this.idObject,
    required this.description,
    required this.read,
  });

  NotificationInfo.empty()
      : id = -1,
        idUser = GlobalData.user!.id,
        date = DateTime.now(),
        type = "",
        idObject = 0,
        description = '',
        read = false;

  factory NotificationInfo.fromJson(Map<String, dynamic> json) {
    return NotificationInfo(
        id: json["id"],
        idUser: json["idUser"],
        date: DateTime.parse(json['date']),
        type: json["type"],
        idObject: json["idObject"],
        description: json["description"],
        read: json["isRead"]);
  }

  Map<String, dynamic> toJson() => {
        "idUser": idUser,
        "date": date.toString(),
        "type": type,
        "description": description,
        "idObject": idObject,
        "isRead": read
      };
}
