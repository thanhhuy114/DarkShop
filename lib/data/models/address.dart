class Address{
  int id;
  String address;

  Address({required this.id, required this.address});
  Address.empty():
    id = -1,
    address = "";

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        id: json['id'],
        address: json['idInvoice']);
  }
}