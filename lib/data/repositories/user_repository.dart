//chứa các hàm tương tác dữ liệu với user
//vd: lấy tất cả user, thêm user vào database
import 'dart:convert';
import 'dart:io';

import 'package:darkshop/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User?> getUserById(int id) async {
    try {
      var response = await http.get(Uri.parse('${Constants.hosting}:3000/users/$id'));

      User user = User.fromJson(jsonDecode(response.body));

      UserLocal().saveUser(user);

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<User>> getAllUsers() async {
    return [
      User(
          id: 1,
          isAdmin: true,
          fullname: "Trần Dương Gia Thịnh",
          image: null,
          phone: "0987654321",
          email: "tdgt@gmail.com",
          recentAddress: "HN",
          blocked: false),
      User(
          id: 2,
          isAdmin: false,
          fullname: "Võ Thành Huy",
          image: null,
          phone: "0123456789",
          email: "vth@gmail.com",
          recentAddress: "hcm",
          blocked: false)
    ];
  }

  String getAddressById(int idAddress) {
    return "hcm";
  }

  saveAvatar(Uint8List image, int idUser) async {
    //lưu avatar mới vào database
  }

  saveFullname(String fullname, int idUser) async {}

  saveEmail(String email, int idUser) async {}

  savePhone(String phone, int idUser) async {}

  blockUser(int idUser) async {}

  unblockUser(int idUser) async {}

  deleteUser(int idUser) async {}

  changePassword(String newPassword, int idUser) async {
    //đổi mất khẩu
  }

  logout() async {
    //đăng xuất
  }
}

class UserLocal {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;

    File file = File('$path/user.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<String> getStringJson() async {
    String s = "";
    try {
      final localFile = await _localFile;
      s = await localFile.readAsString();
    } catch (e) {
      print("getStringJsonUser() error: $e");
    }
    return s;
  }

  Future<User?> getUser() async {
    String json = await getStringJson();

    try {
      User user = User.fromJsonLocal(jsonDecode(json));
      print("Lấy user từ local thành công");
      return user;
    } catch (e) {
      print("Lấy user từ local thất bại");
      print(e);
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    try {
      final file = await _localFile;

      final userMap = user.toJsonLocal();

      final jsonString = json.encode(userMap);

      await file.writeAsString(jsonString);
      print("Lưu User ở local thành công");
    } catch (e) {
      print("Lưu User ở local thất bại");
      print(e);
    }
  }
}