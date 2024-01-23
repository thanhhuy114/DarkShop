import 'package:flutter/material.dart';
import '../../../data/models/notification.dart';
import '../../../utils/colors.dart';
import '../notification_presenter.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard(
      {Key? key, required this.notification, required this.presenter})
      : super(key: key);

  final NotificationPresenter presenter;

  final NotificationInfo notification;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: () => widget.presenter.onclickCard(widget.notification, context),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 247, 247, 247),
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
                            if (!widget.notification.read)
                              const Icon(
                                Icons.circle,
                                size: 8.0,
                                color: Colors.blue,
                              ),
                            Text(
                              widget.presenter.getNotificationTime(widget.notification.date),
                              style: const TextStyle(fontSize: 10),
                            )
                          ],
                        ),
                      ),
                      Text(
                        widget.notification.type,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        widget.notification.description,
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
