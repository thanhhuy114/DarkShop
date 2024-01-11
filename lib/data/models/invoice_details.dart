class InvoiceDetails {
  int id;
  int idInvoice;
  int idProduct;
  int count;
  double totalPrice;

  InvoiceDetails(
      {required this.id,
      required this.idInvoice,
      required this.idProduct,
      required this.count,
      required this.totalPrice});

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) {
    return InvoiceDetails(
        id: json['id'],
        idInvoice: json['idInvoice'],
        idProduct: json['idProduct'],
        count: json['count'],
        totalPrice: json['totalPrice']);
  }
}
