// import 'dart:convert';
// import 'dart:typed_data';

class User2 {
  int id;
  bool isAdmin;
  String name;
  String password;
  String email;
  String phone;
  String? image;
  int? recentAddress;
  bool blocked;
  bool deleted;

  User2({
    required this.id,
    required this.isAdmin,
    required this.name,
    required this.password,
    required this.email,
    required this.phone,
    this.image,
    this.recentAddress,
    required this.blocked,
    required this.deleted,
  });

  factory User2.fromJson(Map<String, dynamic> json) {
    return User2(
      id: json['id'],
      isAdmin: json['isAdmin'],
      name: json['name'],
      password: json['password'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      recentAddress: json['recentAddress'],
      blocked: json['blocked'],
      deleted: json['deleted'],
    );
  }
}
