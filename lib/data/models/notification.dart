class NotificationInfo {
  int id;
  DateTime date;
  String type;
  int idObject;
  String description;
  bool read;

  NotificationInfo({
    required this.id,
    required this.date,
    required this.type,
    required this.idObject,
    required this.description,
    required this.read,
  });

  NotificationInfo.empty()
      : id = -1,
        date = DateTime.now(),
        type = "",
        idObject = 0,
        description = '',
        read = false;

  factory NotificationInfo.fromJson(Map<String, dynamic> json) {
    return NotificationInfo(
        id: json["id"],
        date: DateTime.parse(json['date']),
        type: json["type"],
        idObject: json["idObject"],
        description: json["description"],
        read: json["isRead"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date.toString(),
        "type": type,
        "description": description,
        "idObject": idObject,
        "isRead": read
      };
}
