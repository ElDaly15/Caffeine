import 'package:caffeine/featuers/notification/presentation/views/widgets/notification_container.dart';
import 'package:flutter/material.dart';

class SliverListViewOfNotifications extends StatelessWidget {
  const SliverListViewOfNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: NotificationContainer(),
          );
        });
  }
}
