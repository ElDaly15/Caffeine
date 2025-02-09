import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfSize extends StatelessWidget {
  const ContainerOfSize(
      {super.key, required this.size, required this.isActive});
  final String size;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: MediaQuery.of(context).size.width * 0.27,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          border: Border.all(
              color: isActive ? AppColors.mainColorTheme : Colors.grey),
          color: isActive
              // ignore: deprecated_member_use
              ? AppColors.mainColorTheme.withOpacity(0.2)
              : Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          size,
          style: TextStyles.font18SemiBold(context).copyWith(
              color: isActive ? AppColors.mainColorTheme : Colors.black),
        ),
      ),
    );
  }
}
