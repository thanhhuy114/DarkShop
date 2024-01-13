import 'package:darkshop/views/users_management/components/table_users.dart';
import 'package:darkshop/views/users_management/components/user_info.dart';
import 'package:darkshop/views/users_management/users_management_presenter.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/constants.dart';

class UsersManagementScreen extends StatefulWidget {
  const UsersManagementScreen({super.key});

  @override
  State<UsersManagementScreen> createState() => _UsersManagementScreenState();
}

class _UsersManagementScreenState extends State<UsersManagementScreen> {
  UsersManagementPresenter? presenter;

  @override
  void initState() {
    super.initState();

    UsersManagementPresenter.getAllUsers().then((value) {
      presenter = UsersManagementPresenter(
          users: value,
          reload: () => 
            setState(() {})
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.usersManagement),
        centerTitle: true,
        backgroundColor: MyColors.backgroundAppBar,
      ),
      body: presenter != null
          ? ListView(
              padding: const EdgeInsets.all(8),
              children: [
                if (presenter!.userSeleted != null)
                  UserInfo(
                    user: presenter!.userSeleted!,
                    presenter: presenter!,
                    callback: () {
                      setState(() {});
                    },
                  ),
                TableUsers(presenter: presenter!)
              ],
            )
          : Container(),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
