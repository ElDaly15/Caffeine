import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class RowOfPrice extends StatelessWidget {
  const RowOfPrice({super.key, required this.title, required this.price});
  final String title;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.font18SemiBold(context).copyWith(
            color: AppColors.darkTheme,
          ),
        ),
        const Spacer(),
        Text(
          price,
          style: TextStyles.font18SemiBold(context).copyWith(),
        ),
      ],
    );
  }
}
