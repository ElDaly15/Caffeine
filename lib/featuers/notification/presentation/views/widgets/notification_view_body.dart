import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:flutter/material.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 10,
            color: AppColors.mainColorTheme,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHeaderOfCaffeieApp(),
        ),
      ],
    );
  }
}
