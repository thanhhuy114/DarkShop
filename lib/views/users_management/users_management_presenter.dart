import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/data/repositories/user_repository.dart';

class UsersManagementPresenter {
  List<User> users;
  User? userSeleted;
  Function reload;

  UsersManagementPresenter({required this.users, required this.reload}) {
    reload();
  }

  static Future<List<User>> getAllUsers() async {
    return await UserRepository().getAllUsers();
  }

  updateUserSeleted(User? newUser) {
    userSeleted = newUser;
    reload();
  }

  blockUserSeleted() {
    if (userSeleted != null) {
      UserRepository().blockUser(userSeleted!.id).then((value) {
        reload();
      });
    }
  }

  unblockUserSeleted() {
    if (userSeleted != null) {
      UserRepository().unblockUser(userSeleted!.id).then((value) {
        reload();
      });
    }
  }

  deleteUserSeleted() {
    if (userSeleted != null) {
      UserRepository().deleteUser(userSeleted!.id).then((value) {
        reload();
      });
    }
  }
}
