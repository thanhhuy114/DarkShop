import 'dart:convert';
import 'dart:typed_data';
import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/data/repositories/user_repository.dart';
import 'package:darkshop/main.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/address_management/address_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages

import 'package:image_picker/image_picker.dart';

import '../../data/repositories/notification_repository.dart';

class AccountPresenter {
  static User? userLogin;
  static bool connected = false;

  static Future<User?> getUserLogin(int id) async {
    if (await checkConnection()) {
      userLogin = await UserRepository().getUserById(id);
    } else {
      userLogin = await UserLocal().getUser();
    }

    return userLogin;
  }

  static checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    connected = connectivityResult != ConnectivityResult.none;
    return connected;
  }

  uploadAvatar(Function callback) async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      List<int> imageBytes = await pickedFile.readAsBytes();
      Uint8List uint8list = Uint8List.fromList(imageBytes);

      String? newAvatarUrl = await UserRepository().uploadAvatar(uint8list);

      if (newAvatarUrl != null) {
        int startIndex = newAvatarUrl.lastIndexOf("darkshop/image/avata/");

        String croppedUrl = newAvatarUrl.substring(startIndex);

        await UserRepository().update(jsonEncode({"image": croppedUrl}),
            AccountPresenter.userLogin!.id);
        callback();
      }
    }
  }

  saveChange(String title, String content, Function callback) {
    switch (title) {
      case Constants.fullname:
        if (userLogin!.fullname != content) {
          UserRepository()
              .update(jsonEncode({"name": content}), userLogin!.id)
              .then((value) {
            getUserLogin(userLogin!.id).then((value) {
              callback();
            });
          });
        }
        break;
      case Constants.email:
        if (userLogin!.email != content) {
          UserRepository()
              .update(jsonEncode({"email": content}), userLogin!.id)
              .then((value) {
            getUserLogin(userLogin!.id).then((value) {
              callback();
            });
          });
        }
        break;
      case Constants.phone:
        if (userLogin!.phone != content) {
          UserRepository()
              .update(jsonEncode({"phone": content}), userLogin!.id)
              .then((value) {
            getUserLogin(userLogin!.id).then((value) {
              callback();
            });
          });
        }
        break;
    }
  }

  logout(Function reload) async {
    MyApp.idUserLogin = null;
    await UserLocal().clearUser();
    await NotificationLocal().clearNotifications();
    reload();
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
