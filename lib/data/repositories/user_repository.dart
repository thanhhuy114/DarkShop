//chứa các hàm tương tác dữ liệu với user
//vd: lấy tất cả user, thêm user vào database
import 'dart:convert';

import 'package:darkshop/utils/constants.dart';
import 'package:flutter/services.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User?> getUserById(int id) async {
    try {
      var response = await http.get(Uri.parse('${Constants.hosting}:3000/users/$id'));

      User user = User.fromJson(jsonDecode(response.body));
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

  addAdress(String newAddress, int idUser) async {}

  updateAdress(String newAddress, int idAddress, int idUser) async {}

  deleteAdress(String newAddress, int idUser) async {}

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
