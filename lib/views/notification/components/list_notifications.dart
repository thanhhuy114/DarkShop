import 'package:darkshop/utils/colors.dart';
import 'package:darkshop/utils/constants.dart';
import 'package:darkshop/views/notification/components/notification_card.dart';
import 'package:darkshop/views/notification/notification_presenter.dart';
import 'package:flutter/material.dart';

class ListNotifications extends StatefulWidget {
  const ListNotifications({super.key, required this.presenter});
  final NotificationPresenter presenter;

  @override
  State<ListNotifications> createState() => _ListNotificationsState();
}

class _ListNotificationsState extends State<ListNotifications> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          if (!NotificationPresenter.connected)
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width - 16,
              color: MyColors.backgoundRowMessage,
              child: const Text(
                Constants.noConnected,
                textAlign: TextAlign.center,
              ),
            ),
          if (!NotificationPresenter.connected)
            const Padding(padding: EdgeInsets.only(top: 5)),
          if (widget.presenter.notifications.isEmpty)
            const Text(
              "Không có thông báo!",
              textAlign: TextAlign.center,
            ),
          for (int i = 0; i < widget.presenter.notifications.length; i++)
            NotificationCard(
              notification: widget.presenter.notifications[i],
              presenter: widget.presenter,
            )
        ],
      ),
    );
  }
}
