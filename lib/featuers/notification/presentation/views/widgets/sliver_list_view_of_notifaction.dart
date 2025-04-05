import 'package:caffeine/featuers/notification/data/model/notification_model.dart';
import 'package:caffeine/featuers/notification/presentation/views/widgets/notification_container.dart';
import 'package:flutter/material.dart';

class SliverListViewOfNotifications extends StatelessWidget {
  const SliverListViewOfNotifications({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: NotificationContainer(
              notificationModel: notifications[index],
            ),
          );
        });
  }
}
