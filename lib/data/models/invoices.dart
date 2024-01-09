class Invoices {
  int id;
  int idUser;
  String createAt;
  int idPayment;
  double totalPrice;
  int status;
  String note;

  Invoices({
    required this.id,
    required this.idUser,
    required this.createAt,
    required this.idPayment,
    required this.totalPrice,
    required this.status,
    required this.note,
  });
}
