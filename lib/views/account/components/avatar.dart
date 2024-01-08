import 'dart:typed_data';

import 'package:darkshop/views/account/account_presenter.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.image, required this.callback});
  final Uint8List? image;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AccountPresenter().chooseAvatar(),
      child: Container(
                child: image != null
                    ? SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: ClipOval(
                          child: Image.memory(
                            image!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 100.0,
                        height: 100.0,
                        child: ClipOval(
                          child: Image.asset(
                            Constants.avatarDefault,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ),
    );
  }
}