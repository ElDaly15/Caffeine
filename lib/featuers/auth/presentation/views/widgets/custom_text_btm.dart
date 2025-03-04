import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTextButtom extends StatelessWidget {
  const CustomTextButtom({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Text(
          S.of(context).forgot_password,
          style: TextStyles.font18Bold(context)
              .copyWith(color: AppColors.secondaryColorTheme),
        ));
  }
}
