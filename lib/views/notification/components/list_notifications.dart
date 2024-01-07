import 'package:darkshop/data/models/notification.dart';
import 'package:darkshop/views/notification/components/notification_card.dart';
import 'package:darkshop/views/notification/notification_presenter.dart';
import 'package:flutter/material.dart';

class ListNotifications extends StatelessWidget {
  const ListNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    List<NotificationInfo>? notifications =
        NotificationPresenter().loadNotifications();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          if (notifications != null)
            for (int i = 0; i < notifications.length; i++)
              NotificationCard(notification: notifications[i])
        ],
      ),
    );
  }
}
