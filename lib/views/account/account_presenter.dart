import 'dart:convert';
import 'dart:typed_data';
import 'package:connectivity/connectivity.dart';
import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/data/repositories/user_repository.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/views/address_management/address_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../data/repositories/notification_repository.dart';

class AccountPresenter {
  static bool connected = false;

  static Future<User?> getUserLogin(int id) async {
    if (await checkConnection()) {
      GlobalData.user = await UserRepository().getUserById(id);
    } else {
      GlobalData.user = await UserLocal().getUser();
    }

    return GlobalData.user;
  }

  static checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());

    connected = connectivityResult != ConnectivityResult.none;
    GlobalData.isConneted = connected;
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
            GlobalData.user!.id);
        callback();
      }
    }
  }

  saveChange(String title, String content, Function callback) {
    switch (title) {
      case Constants.fullname:
        if (GlobalData.user!.fullname != content) {
          UserRepository()
              .update(jsonEncode({"name": content}), GlobalData.user!.id)
              .then((value) {
            getUserLogin(GlobalData.user!.id).then((value) {
              callback();
            });
          });
        }
        break;
      case Constants.email:
        if (GlobalData.user!.email != content) {
          UserRepository()
              .update(jsonEncode({"email": content}), GlobalData.user!.id)
              .then((value) {
            getUserLogin(GlobalData.user!.id).then((value) {
              callback();
            });
          });
        }
        break;
      case Constants.phone:
        if (GlobalData.user!.phone != content) {
          UserRepository()
              .update(jsonEncode({"phone": content}), GlobalData.user!.id)
              .then((value) {
            getUserLogin(GlobalData.user!.id).then((value) {
              callback();
            });
          });
        }
        break;
    }
  }

  logout(Function reload) async {
    GlobalData.user = null;
    GlobalData.isLogin = false;
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