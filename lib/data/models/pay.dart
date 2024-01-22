class Pay {
  int id;
  int idUser;
  String name;

  Pay({required this.id, required this.idUser, required this.name});

  factory Pay.fromJson(Map<String, dynamic> json) {
    return Pay(
      id: json['id'],
      idUser: json['idUser'],
      name: json['typeName'],
    );
  }

}
