import 'dart:typed_data';
import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/data/repositories/user_repository.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/address_management/address_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages

import 'package:image_picker/image_picker.dart';

class AccountPresenter {
  static User? userLogin;
  Function? reload;

  static Future<User?> getUserLogin(int id) async {
    //tạm thời
    userLogin = await UserRepository().getUserById(id);

    return userLogin;
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddressManagementScreen(),
      ),
    );
  }
}
