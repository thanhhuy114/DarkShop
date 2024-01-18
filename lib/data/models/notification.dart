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
      :date = DateTime.now(),
        type = "",
        idObject = 0,
        description = '',
        read = false;
}
