import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomTextFieldOfCopons extends StatelessWidget {
  const CustomTextFieldOfCopons(
      {super.key,
      required this.onPressed,
      required this.onSubmitted,
      required this.isLoading});
  final void Function() onPressed;
  final void Function(String value) onSubmitted;
  final bool isLoading;

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
          suffixIcon: isLoading
              ? SizedBox(
                  height: 30,
                  width: 30,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: AppColors.mainColorTheme,
                    ),
                  ),
                )
              : IconButton(
                  onPressed: onPressed,
                  icon: Icon(
                    Icons.add,
                    color: AppColors.mainColorTheme,
                  )),
          hintText: S.of(context).enter_coupon_code,
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
