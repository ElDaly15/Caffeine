import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTextFieldOfCopons extends StatelessWidget {
  const CustomTextFieldOfCopons(
      {super.key, required this.onPressed, required this.onSubmitted});
  final void Function() onPressed;
  final void Function(String value) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: const TextSelectionThemeData(
        cursorColor: AppColors.mainColorTheme,
        selectionColor: AppColors.mainColorTheme,
        selectionHandleColor: AppColors.mainColorTheme,
      ),
      child: TextField(
        onChanged: onSubmitted,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            IconlyLight.discount,
            color: AppColors.mainColorTheme,
          ),
          suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                Icons.add,
                color: AppColors.mainColorTheme,
              )),
          hintText: 'Enter Your Coupon Code Here',
          hintStyle: TextStyles.font18SemiBold(context).copyWith(
            color: Color(0xffA2A2A2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffEDEDED), width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffEDEDED), width: 1.4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color(0xffEDEDED), width: 2),
          ),
        ),
        cursorColor: AppColors.mainColorTheme,
        style: TextStyles.font18SemiBold(context).copyWith(
          color: AppColors.darkTheme,
        ),
      ),
    );
  }
}
