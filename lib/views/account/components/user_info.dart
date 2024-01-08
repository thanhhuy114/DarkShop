import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/account/account_presenter.dart';
import 'package:darkshop/views/account/components/avatar.dart';
import 'package:darkshop/views/account/components/custom_textfield.dart';
import 'package:darkshop/views/account/components/custom_button.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  User user = AccountPresenter.userLogin!;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: MyColors.backgroundUserInfo,
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Avatar(
                image: user.image,
                callback: () {
                  setState(() {});
                }),
          ],
        ),
        CustomTextfield(title: Constants.fullname, content: user.fullname),
        CustomTextfield(title: Constants.email, content: user.email),
        CustomTextfield(title: Constants.phone, content: user.phone),
        CustomTextfield(
            title: Constants.address, content: user.recentAddress),
        CustomButton(
            title: Constants.changePassword,
            onClick:()=> AccountPresenter().gotoChangePassword(context)),
        CustomButton(
            title: Constants.logout, onClick:()=> AccountPresenter().logout()),
      ]),
    );
  }
}
