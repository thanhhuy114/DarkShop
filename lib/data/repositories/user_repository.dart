import 'dart:convert';
import 'dart:io';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/utils/global_data.dart';
import 'package:darkshop/utils/screen_size.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<User?> getUserById(int id) async {
    try {
      var response =
          await http.get(Uri.parse('$hosting/users/$id'));

      User user = User.fromJson(jsonDecode(response.body));

      if (kDebugMode) {
        print("Lấy user ở server thành công");
      }

      UserLocal().saveUser(user);

      return user;
    } catch (e) {
      if (kDebugMode) {
        print("Lấy user ở server thất bại");
      }
      if (kDebugMode) {
        print(e);
      }
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

  Future<String?> uploadAvatar(Uint8List imageBytes) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.hosting}:3000/users/upload_avatar'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'image': imageBytes}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Upload Ảnh Thành Công");
        return responseData['data'];
      } else {
        print('Upload Thất bại status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Lỗi uploading avatar: $e');
      return null;
    }
  }

  update(String json, int idUser) async {
    try {
      final response =
          await http.put(Uri.parse('${Constants.hosting}:3000/users/$idUser'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: json);

      if (response.statusCode == 200) {
        print('Cập nhật user ở sever thành công');
        GlobalData.user = await getUserById(idUser);
      } else {
        if (kDebugMode) {
          print('Cập nhật user ở sever thất bại');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Lỗi Cập nhật ở sever user: $e');
      }
    }
  }

  blockUser(int idUser) async {}

  unblockUser(int idUser) async {}

  deleteUser(int idUser) async {}

  changePassword(String newPassword, int idUser) async {
    //đổi mất khẩu
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
      if (kDebugMode) {
        print("getStringJsonUser() error: $e");
      }
    }
    return s;
  }

  Future<User?> getUser() async {
    String json = await getStringJson();

    try {
      User user = User.fromJsonLocal(jsonDecode(json));
      if (kDebugMode) {
        print("Lấy user từ local thành công");
      }
      return user;
    } catch (e) {
      if (kDebugMode) {
        print("Lấy user từ local thất bại");
      }
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<void> saveUser(User user) async {
    try {
      final file = await _localFile;

      final userMap = user.toJsonLocal();

      final jsonString = json.encode(userMap);

      await file.writeAsString(jsonString);
      if (kDebugMode) {
        print("Lưu User ở local thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Lưu User ở local thất bại");
      }
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> clearUser() async {
    try {
      final file = await _localFile;

      await file.writeAsString('');

      if (kDebugMode) {
        print("Xóa user ở local thành công");
      }
    } catch (e) {
      if (kDebugMode) {
        print("Xóa user ở local thất bại");
      }
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
