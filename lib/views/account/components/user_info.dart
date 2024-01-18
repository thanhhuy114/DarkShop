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
    if (AccountPresenter.userLogin == null) {
      return Container(
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
      );
    }
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
                image: "${Constants.pathClould}darkshop/image/product/mobile/v3wlmlwnaui5cbbhnutf.webp",
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
