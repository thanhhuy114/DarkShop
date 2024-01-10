import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/account/components/user_info.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    AccountPresenter.getUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(Constants.account), centerTitle: true, backgroundColor: MyColors.backgroundAppBar,),
      body: ListView(children: const [
        UserInfo(),
      ],),
      backgroundColor: MyColors.backgroundApp,
    );
  }
}