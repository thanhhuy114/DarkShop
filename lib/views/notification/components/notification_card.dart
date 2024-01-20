import 'package:flutter/material.dart';
import '../../../data/models/notification.dart';
import '../../../utils/colors.dart';
import '../notification_presenter.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key, required this.notification, required this.presenter})
      : super(key: key);

  final NotificationPresenter presenter;

  final NotificationInfo notification;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () => presenter.onclickCard(notification, context),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: MyColors.backgroundCard,
          ),
          child: Row(
            children: [
              const Icon(Icons.notifications, size: 80),
              Expanded(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (!notification.read)
                              const Icon(
                                Icons.circle,
                                size: 8.0,
                                color: Colors.blue,
                              ),
                            Text(
                              presenter.getNotificationTime(notification.date),
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Text(
                        notification.type,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        notification.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
