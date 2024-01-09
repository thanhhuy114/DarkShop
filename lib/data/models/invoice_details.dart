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
}
