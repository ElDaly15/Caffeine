import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ErrorWidgetWithHeader extends StatelessWidget {
  const ErrorWidgetWithHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 10,
            color: AppColors.mainColorTheme,
          ),
          CustomHeaderOfCaffeieApp(),
          Spacer(),
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
          Spacer(),
        ],
      ),
    );
  }
}
