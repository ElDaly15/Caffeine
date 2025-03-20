import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatefulWidget {
  CustomTextField(
      {super.key,
      required this.hintTitle,
      required this.isPassword,
      required this.isObscureText,
      this.onChanged,
      required this.isInLogin,
      this.type});
  final String hintTitle;
  final bool isPassword;
  final bool isInLogin;
  final TextInputType? type;
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
      child: TextFormField(
        keyboardType: widget.type ?? TextInputType.text,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.hintTitle} ${S.of(context).is_required}';
          }
          if (widget.isPassword) {
            if (value.length < 8 && widget.isInLogin == true) {
              return S.of(context).password_min_length;
            }
          }
          if (!widget.isPassword) {
            // التحقق إذا كان الحقل ليس كلمة مرور
            final regex = RegExp(r'^(010|011|012|015)[0-9]{8}$');
            if (!regex.hasMatch(value)) {
              return S
                  .of(context)
                  .invalid_phone_number; // تأكد من أن لديك هذا المفتاح في `l10n`
            }
          }
          return null;
        },
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
                width: 1.2,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(
              color: AppColors.secondaryColorTheme,
              strokeAlign: 1.2,
              width: 1.2,
            ),
          ),
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.2,
                color: Color.fromARGB(255, 212, 48, 36),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          errorStyle: TextStyles.font14Medium(context)
              .copyWith(color: const Color.fromARGB(255, 212, 48, 36)),
        ),
        style: TextStyles.font18Medium(context),
        obscureText: widget.isObscureText,
      ),
    );
  }
}
