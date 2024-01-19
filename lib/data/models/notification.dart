class NotificationInfo {
  DateTime date;
  String type;
  int idObject;
  String description;
  bool read;

  NotificationInfo({
    required this.date,
    required this.type,
    required this.idObject,
    required this.description,
    required this.read,
  });

  NotificationInfo.empty()
      : date = DateTime.now(),
        type = "",
        idObject = 0,
        description = '',
        read = false;

  factory NotificationInfo.fromJson(Map<String, dynamic> json) {
    return NotificationInfo(
        date: DateTime.parse(json['date']),
        type: json["type"],
        idObject: json["idObject"],
        description: json["description"],
        read: json["isRead"]);
  }

  Map<String, dynamic> toJson() => {
        "date": date.toString(),
        "type": type,
        "description": description,
        "idObject": idObject,
        "isRead": read
      };
}
