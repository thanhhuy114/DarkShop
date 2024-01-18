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

}
