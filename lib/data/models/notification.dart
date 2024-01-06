class Notification{
  int idUser;
  DateTime date;
  String title;
  String? imagePath;
  String description;
  bool read;

  Notification({
    required this.idUser,
    required this.date,
    required this.title,
    required this.description,
    required this.read,
  }){
    if(title == ""){
      imagePath = "";
    }
  }

  Notification.empty()
      : idUser = 0,
        date = DateTime.now(),
        title = '',
        description = '',
        read = false,
        imagePath = '';
}