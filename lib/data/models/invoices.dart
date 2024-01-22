// import 'dart:typed_data';

class Invoice {
  int id;
  int idUser;
  int idProduct;
  String createAt;
  int idPayment;
  int totalPrice;
  int status;
  String note;
  int idAddress;

  Invoice({
    required this.id,
    required this.idUser,
    required this.idProduct,
    required this.createAt,
    required this.idPayment,
    required this.totalPrice,
    required this.status,
    required this.note,
    required this.idAddress,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) {
    return Invoice(
      id: json['id'] ?? 0,
      idUser: json['idUser'],
      idProduct: json['idProduct'],
      createAt: json['createAt'] ?? '',
      idPayment: json['idPayment'] ?? 0,
      totalPrice: json['totalPrice'] ?? 0,
      status: json['status'] ?? 0,
      idAddress: json['idAddress'] ?? 0,
      note: json['note'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idUser': idUser,
      'idProduct': idProduct,
      'createAt': createAt,
      'idPayment': idPayment,
      'totalPrice': totalPrice,
      'status': status,
      'note': note,
      'idAddress': idAddress,
    };
  }
}
