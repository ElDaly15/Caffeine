import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/core/widgets/loading_widgets/loading_notifcation_list.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class NotificationLoadingView extends StatelessWidget {
  const NotificationLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 10,
          color: AppColors.mainColorTheme,
        ),
        CustomHeaderOfCaffeieApp(),
        SizedBox(height: 10),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Notification',
              style: TextStyles.font24SemiBold(context),
            ),
          ),
        ),
        SizedBox(height: 10),
        Expanded(child: ListViewOfNotifications()),
      ],
    );
  }
}
