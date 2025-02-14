import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap});
  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.mainColorTheme,
        ),
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(title,
          style: TextStyles.font20Medium(context)
              .copyWith(color: AppColors.darkTheme)),
    );
  }
}
