import 'package:darkshop/views/notification/components/notification_card.dart';
import 'package:darkshop/views/notification/notification_presenter.dart';
import 'package:flutter/material.dart';

class ListNotifications extends StatelessWidget {
  const ListNotifications({super.key, required this.presenter});
  final NotificationPresenter presenter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          if(presenter.notifications.isEmpty)const  Text("Không có thông báo!", textAlign: TextAlign.center,),
          for (int i = 0; i < presenter.notifications.length; i++)
            NotificationCard(
              notification: presenter.notifications[i],
              presenter: presenter,
            )
        ],
      ),
    );
  }
}
