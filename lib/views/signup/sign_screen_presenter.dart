import 'package:darkshop/data/models/user.dart' as model;
import 'package:darkshop/utils/screen_size.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;

abstract class SignUpView {
  displayMess(bool? result, {phoneNumber = '', String mess = ''}) {}
}

class SignUpPresenter {
  late final SignUpView _view;

  SignUpPresenter(this._view);

  checkNotExistPhone(String phoneNumber) async {
    if (phoneNumber.isEmpty) return _view.displayMess(null);
    phoneNumber = phoneNumber.trim();

    phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');
    if (phoneNumber[0] != '0') phoneNumber = '0$phoneNumber';

    if (!isPhoneNumberValid(phoneNumber)) return _view.displayMess(null);
    return _view.displayMess(await checkNotExistPhoneAPI(phoneNumber),
        phoneNumber: phoneNumber);
  }

  Future<void> addUser(model.User user, String password) async {
    if (!isPasswordValid(password)) {
      return _view.displayMess(false,
          mess:
              'Mật khẩu có ít nhất 8 ký tự, chứa ít nhất một chữ cái và một chữ số');
    }
    if (!EmailValidator.validate(user.email)) {
      _view.displayMess(false, mess: 'Mail không hợp lệ');
      return;
    }

    var body = {
      "password": password,
      "isAdmin": 'false',
      "name": user.fullname,
      "email": user.email,
      "phone": user.phone,
      "image": "path/to/image.jpg",
      "recentAddressId": 'null',
      "blocked": 'false'
    };

    try {
      var result = await http.post(Uri.parse('$hosting/users/'), body: body);

      if (result.statusCode == 200) {
        _view.displayMess(true, mess: 'Tạo tài khoản thành công');
      } else if (result.statusCode == 201) {
        _view.displayMess(false, mess: 'Mail này đã tồn tại');
      } else {
        _view.displayMess(true, mess: 'Không thành công');
      }
    } catch (e) {
      _view.displayMess(true, mess: 'Lỗi server rồi');
    }
  }

  bool isPhoneNumberValid(String phoneNumber) {
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(phoneNumber);
  }

  Future<bool> checkNotExistPhoneAPI(String phoneNumber) async {
    var body = {"phone": phoneNumber};
    try {
      var result =
          await http.post(Uri.parse('$hosting/check-phone'), body: body);

      if (result.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool isPasswordValid(String password) {
    RegExp regex = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    return regex.hasMatch(password);
  }
}
