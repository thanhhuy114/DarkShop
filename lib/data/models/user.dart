import 'dart:convert';
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
    Uint8List? imageBytes;
    if (json.containsKey('image') && json['image'] != null) {
      String? base64Image = json['image'];
      if (base64Image != null) {
        // imageBytes = base64Decode(base64Image);
      }
    }

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

  //Hàm chuyển sang json để lưu xuống local
  Map<String, dynamic> toJsonLocal() {
    return {
      'id': id,
      'isAdmin': isAdmin,
      'name': fullname,
      'phone': phone,
      'email': email,
      'recentAddressId': recentAddress,
      'blocked': blocked,
    };
  }

  //lấy user từ local
  factory User.fromJsonLocal(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      isAdmin: json['isAdmin'],
      fullname: json['name'],
      image: null, 
      phone: json['phone'],
      email: json['email'],
      recentAddress: json['recentAddressId'],
      blocked: json['blocked'],
    );
  }
}
