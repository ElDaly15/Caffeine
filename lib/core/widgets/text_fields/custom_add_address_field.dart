import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomAddAddressField extends StatefulWidget {
  const CustomAddAddressField({
    super.key,
    required this.title,
    required this.onChanged,
    required this.keyBoardType,
    required this.maxLines,
    required this.controller,
  });
  final String title;
  final Function(String)? onChanged;
  final TextInputType keyBoardType;
  final int maxLines;
  final TextEditingController controller;
  @override
  State<CustomAddAddressField> createState() => _CustomEditTextFieldState();
}

class _CustomEditTextFieldState extends State<CustomAddAddressField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: AppColors.mainColorTheme,
          selectionHandleColor: AppColors.mainColorTheme,
        ),
      ),
      child: TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        keyboardType: widget.keyBoardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '${widget.title} ${S.of(context).is_required}';
          }
          return null;
        },
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          // ignore: deprecated_member_use
          fillColor: AppColors.secondaryColorTheme.withOpacity(0.2),
          focusColor: AppColors.mainColorTheme,
          focusedBorder: customOutlineBorder(),
          enabledBorder: customOutlineBorder(),
          border: customOutlineBorder(),
          hintText: widget.title,
          hintStyle:
              TextStyles.font18Medium(context).copyWith(color: Colors.grey),
          labelStyle: const TextStyle(
            color: AppColors.mainColorTheme,
          ),
        ),
        cursorColor: AppColors.mainColorTheme,
        style: TextStyles.font18Medium(context),
      ),
    );
  }

  OutlineInputBorder customOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(
        width: 1.3,
        color: AppColors.mainColorTheme,
      ),
    );
  }
}
