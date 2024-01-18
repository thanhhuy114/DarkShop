import 'dart:typed_data';

import 'package:darkshop/data/repositories/user_repository.dart';

class User {
  int id;
  bool isAdmin;
  String fullname;
  String? image;
  String phone;
  String email;
  String recentAddress;
  bool blocked;

  User({
    required this.id,
    required this.isAdmin,
    required this.fullname,
    required this.image,
    required this.phone,
    required this.email,
    required this.recentAddress,
    required this.blocked,
  });

  User.empty()
      : id = 0,
        isAdmin = false,
        fullname = '',
        phone = '',
        email = '',
        recentAddress = '',
        blocked = false;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        isAdmin: json['isAdmin'],
        fullname: json['name'],
        image: json['image'],
        phone: json['phone'],
        email: json['email'],
        recentAddress: json['recentAddressId'] == null
            ? "Chưa có địa chỉ được sử dụng"
            : UserRepository().getAddressById(json['recentAddressId']),
        blocked: json['blocked']);
  }
}
