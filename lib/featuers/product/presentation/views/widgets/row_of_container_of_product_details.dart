import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class RowOfContainersOfProductDetails extends StatelessWidget {
  const RowOfContainersOfProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ice/Hot',
          style: TextStyles.font18Medium(context).copyWith(color: Colors.grey),
        ),
        Spacer(),
        Row(
          children: [
            Icon(
              IconlyBold.star,
              color: AppColors.mainColorTheme,
              size: 22,
            ),
            const SizedBox(width: 2),
            Text(
              '4.8',
              style: TextStyles.font18Medium(context).copyWith(),
            ),
            SizedBox(
              width: 6,
            ),
          ],
        ),
      ],
    );
  }
}
