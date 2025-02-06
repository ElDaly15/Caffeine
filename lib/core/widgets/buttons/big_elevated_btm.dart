import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class BigElevatedBtm extends StatelessWidget {
  const BigElevatedBtm(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            minimumSize: const Size(double.infinity, 55),
            backgroundColor: AppColors.secondaryColorTheme),
        onPressed: () {},
        child: Text(
          text,
          style: TextStyles.font22SemiBold(context)
              .copyWith(color: AppColors.mainColorTheme),
        ));
  }
}
