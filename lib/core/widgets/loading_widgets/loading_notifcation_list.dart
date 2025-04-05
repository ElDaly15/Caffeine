import 'package:caffeine/featuers/notification/data/model/notification_model.dart';
import 'package:caffeine/featuers/notification/presentation/views/widgets/notification_container.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewOfNotifications extends StatelessWidget {
  const ListViewOfNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: NotificationContainer(
              notificationModel: NotificationModel(
                id: 'sd',
                date: DateTime.now(),
                titleAr: 'New Product',
                bodyEn:
                    'New Product Caffe Late With Milk Cold/Hot With Discount 30% Off Now .',
                titleEn: 'New Product',
                bodyAr:
                    'New Product Caffe Late With Milk Cold/Hot With Discount 30% Off Now .',
              ),
            ),
          );
        },
      ),
    );
  }
}
