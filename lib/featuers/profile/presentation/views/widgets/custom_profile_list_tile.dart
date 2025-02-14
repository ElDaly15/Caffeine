import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomProfileListTile extends StatelessWidget {
  const CustomProfileListTile(
      {super.key,
      required this.title,
      required this.icon,
      required this.onTap,
      required this.hasSwitch,
      required this.hasTrailling,
      required this.onChangedSwitch,
      required this.statusOfNotification});
  final String title;
  final IconData icon;
  final Function()? onTap;
  final bool hasSwitch;
  final bool hasTrailling;
  final void Function(bool)? onChangedSwitch;
  final bool statusOfNotification;

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
        title: Text(
          title,
          style: TextStyles.font20Medium(context)
              .copyWith(color: AppColors.darkTheme),
        ),
        trailing: hasTrailling
            ? hasSwitch
                ? Switch(
                    activeColor: AppColors.mainColorTheme,
                    value: statusOfNotification,
                    onChanged: onChangedSwitch)
                : Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.darkTheme,
                    size: 20,
                  )
            : null);
  }
}
