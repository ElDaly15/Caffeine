import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomContainerWithIconAndText extends StatelessWidget {
  const CustomContainerWithIconAndText(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});
  final String title;
  final IconData iconData;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0XFFA2A2A2), width: 1.8)),
        child: Row(
          children: [
            Icon(iconData),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyles.font18Medium(context)
                  .copyWith(color: AppColors.darkTheme),
            ),
          ],
        ),
      ),
    );
  }
}
