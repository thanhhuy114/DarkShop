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
                image: AccountPresenter.userLogin!.image != null
                    ? "${Constants.pathClould}${AccountPresenter.userLogin!.image}"
                    : null,
                callback: () {
                  setState(() {});
                }),
          ],
        ),
        CustomTextfield(
            title: Constants.fullname,
            content: AccountPresenter.userLogin!.fullname),
        CustomTextfield(
            title: Constants.email, content: AccountPresenter.userLogin!.email),
        CustomTextfield(
            title: Constants.phone, content: AccountPresenter.userLogin!.phone),
        CustomTextfield(
            title: Constants.address,
            content: AccountPresenter.userLogin!.recentAddress),
        CustomButton(
            title: Constants.changePassword,
            onClick: () => AccountPresenter().gotoChangePassword(context)),
        CustomButton(
            title: Constants.logout,
            onClick: () => AccountPresenter().logout()),
      ]),
    );
  }
}
