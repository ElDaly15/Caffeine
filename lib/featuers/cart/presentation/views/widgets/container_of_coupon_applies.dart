import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ContainerOfCouponSuccessApplied extends StatelessWidget {
  const ContainerOfCouponSuccessApplied({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffEDEDED), width: 1.2),
      ),
      child: Row(
        children: [
          Icon(
            IconlyLight.discount,
            color: AppColors.mainColorTheme,
          ),
          SizedBox(
            width: 15,
          ),
          Text(
            '1 Discount is Applies',
            style: TextStyles.font18SemiBold(context).copyWith(
              color: AppColors.darkTheme,
            ),
          ),
        ],
      ),
    );
  }
}
