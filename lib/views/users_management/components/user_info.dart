import 'package:darkshop/data/models/user.dart';
import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/account/components/avatar.dart';
import 'package:darkshop/views/users_management/users_management_presenter.dart';
import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo(
      {super.key,
      required this.user,
      required this.presenter,
      required this.callback});
  final UsersManagementPresenter presenter;
  final User user;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: MyColors.backgroundUserInfo,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 40),
            Avatar(image: user.image, callback: callback),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    presenter.updateUserSeleted(null);
                  },
                  icon: const Icon(Icons.cancel),
                ),
                const SizedBox(width: 40, height: 80),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${Constants.fullname}: ${user.fullname}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${Constants.email}: ${user.email}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${Constants.phone}: ${user.phone}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "${Constants.address}: ${user.recentAddress}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                          color: MyColors.backgroundButton,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: user.blocked
                                  ? presenter.unblockUserSeleted()
                                  : presenter.blockUserSeleted(),
                              icon: user.blocked
                                  ? const Icon(Icons.lock)
                                  : const Icon(Icons.lock_open)),
                              const Text(Constants.block)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                          color: MyColors.backgroundButton,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: presenter.deleteUserSeleted(),
                              icon: const Icon(Icons.delete_outlined)),
                              const Text(Constants.delete)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
