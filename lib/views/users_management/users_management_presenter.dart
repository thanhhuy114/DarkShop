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
    UserRepository().blockUser(userSeleted!.id).then((value) {
      reload();
    });
  }

  unblockUserSeleted() {
    UserRepository().unblockUser(userSeleted!.id).then((value) {
      reload();
    });
  }

  deleteUserSeleted() {
    UserRepository().deleteUser(userSeleted!.id).then((value) {
      reload();
    });
  }
}
