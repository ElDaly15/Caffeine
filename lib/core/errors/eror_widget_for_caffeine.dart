import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorWidgetForCaffeineApp extends StatelessWidget {
  const ErrorWidgetForCaffeineApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Keep the column compact

        children: [
          Icon(
            Icons.error,
            color: AppColors.mainColorTheme,
            size: 120,
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            S.of(context).error_occurred,
            style: TextStyles.font20SemiBold(context)
                .copyWith(color: AppColors.mainColorTheme),
          ),
        ],
      ),
    );
  }
}
