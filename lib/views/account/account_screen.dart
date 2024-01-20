import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/account/components/user_info.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../notification/components/request_login.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Constants.account),
        centerTitle: true,
        backgroundColor: MyColors.backgroundAppBar,
      ),
      body: MyApp.idUserLogin == null
          ? const RequestLogin()
          : AccountPresenter.userLogin == null
              ? Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(255, 232, 187, 187),
                    Color.fromARGB(255, 239, 186, 11)
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Constants.logo,
                        width: 150,
                        height: 150,
                      )
                    ],
                  ),
                )
              : ListView(
                  children: [
                    !AccountPresenter.connected
                        ? Container(
                            height: 20,
                            width: MediaQuery.of(context).size.width,
                            color: MyColors.backgoundRowMessage,
                            child: const Text(
                              Constants.noConnected,
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Container(),
                    const UserInfo(),
                  ],
                ),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}
