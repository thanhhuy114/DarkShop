<<<<<<< HEAD
//class user
=======
import 'package:flutter/services.dart';

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
}
>>>>>>> acc8e9396b42b0d36a2fe32b2b39f303f164958a
