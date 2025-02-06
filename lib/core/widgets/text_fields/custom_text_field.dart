import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.hintTitle,
      required this.isPassword,
      required this.isObscureText,
      this.onChanged});
  final String hintTitle;
  final bool isPassword;
  late bool isObscureText;
  final Function(String)? onChanged;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextSelectionTheme(
      data: const TextSelectionThemeData(
        cursorColor: AppColors.mainColorTheme,
        selectionColor: AppColors.mainColorTheme,
        selectionHandleColor: AppColors.mainColorTheme,
      ),
      child: TextField(
        onChanged: widget.onChanged,
        cursorColor: AppColors.mainColorTheme,
        decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: widget.isPassword,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.isObscureText = !widget.isObscureText;
                  });
                },
                icon: widget.isObscureText
                    ? const Icon(
                        Icons.remove_red_eye_rounded,
                        color: AppColors.mainColorTheme,
                      )
                    : const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.mainColorTheme,
                      )),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          hintText: widget.hintTitle,
          hintStyle: TextStyles.font18Medium(context)
              .copyWith(color: AppColors.mainColorTheme),
          fillColor: AppColors.secondaryColorTheme,
          filled: true,
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.secondaryColorTheme,
                strokeAlign: 2,
                width: 1.8,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
                color: AppColors.secondaryColorTheme, strokeAlign: 2),
          ),
        ),
        style: TextStyles.font18Medium(context),
        obscureText: widget.isObscureText,
      ),
    );
  }
}
