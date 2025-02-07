import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfCategoryItem extends StatelessWidget {
  const ContainerOfCategoryItem(
      {super.key, required this.categoryTitle, required this.isActive});
  final String categoryTitle;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
          color: isActive ? AppColors.mainColorTheme : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Center(
        child: Text(
          categoryTitle,
          style: TextStyles.font20SemiBold(context)
              .copyWith(color: isActive ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
