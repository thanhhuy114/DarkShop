class NotificationInfo {
  DateTime date;
  int type;
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
        type = 0,
        idObject = 0,
        description = '',
        read = false;
}
