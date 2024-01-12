<<<<<<< HEAD
//xử lý tương tác bên giao diện
//vd: nhấn nút ...
=======
import 'dart:convert';

import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/data/repositories/user_repository.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AccountPresenter {
  static User? userLogin;

  static Future<User?> getUserLogin() async {
    //tạm thời
    userLogin = await UserRepository().getUserLogin();

    return userLogin;
  }

  static Future<List<User>?> getAllUsers() async {
    return await UserRepository().getAllUsers();
  }

  static Uint8List convertStringToUint8List(String base64String) {
    List<int> bytes = base64.decode(base64String);
    return Uint8List.fromList(bytes);
  }

  uploadAvatar(Function callback) async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      Uint8List uint8list = Uint8List.fromList(imageBytes);

      await UserRepository().saveAvatar(uint8list, userLogin!.id);
      callback();
    }
  }

  saveChange(String title, String content, Function callback) {
    switch (title) {
      case Constants.fullname:
        if (userLogin!.fullname != content) {
          UserRepository().saveFullname(content, userLogin!.id);
        }
        callback();
        break;
      case Constants.email:
        if (userLogin!.email != content) {
          UserRepository().saveEmail(content, userLogin!.id);
        }
        callback();
        break;
      case Constants.phone:
        if (userLogin!.phone != content) {
          UserRepository().savePhone(content, userLogin!.id);
        }
        callback();
        break;
    }
  }

  logout() {
    //đăng xuất
  }

  gotoChangePassword(BuildContext context) {
    //chuyển trang đổi mật khẩu
  }

  gotoAddressManagement(BuildContext context) {
    //chuyển trang quản lý địa chỉ
  }
}
>>>>>>> acc8e9396b42b0d36a2fe32b2b39f303f164958a
