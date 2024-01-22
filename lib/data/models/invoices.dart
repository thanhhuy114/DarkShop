class Invoice {
  int id;
  int idUser;
  String createAt;
  int idPayment;
  double totalPrice;
  int status;
  String note;

  Invoice({
    required this.id,
    required this.idUser,
    required this.createAt,
    required this.idPayment,
    required this.totalPrice,
    required this.status,
    required this.note,
  });

  Invoice.empty()
      : id = 0,
        idUser = 0,
        createAt = '',
        idPayment = 0,
        totalPrice = 0,
        status = 0,
        note = '';

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
        id: json['id'],
        idUser: json['idUser'],
        createAt: json['createAt'],
        idPayment: json['idPayment'],
        totalPrice: json['totalPrice'],
        status: json['status'],
        note: json['note']);
  }
}
