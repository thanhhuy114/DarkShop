import 'dart:convert';
import 'dart:typed_data';

class User {
  int id;
  bool isAdmin;
  String fullname;
  Uint8List? image;
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
        imageBytes = base64Decode(base64Image);
      }
    }

    return User(
      id: json['id'],
      isAdmin: json['isAdmin'],
      fullname: json['fullname'],
      image: imageBytes,
      phone: json['phone'],
      email: json['email'],
      recentAddress: json['recentAddress'],
      blocked: json['blocked'],
    );
  }
}
