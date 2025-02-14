import 'package:caffeine/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAddAddressField extends StatefulWidget {
  const CustomAddAddressField({
    super.key,
    required this.title,
    required this.onChanged,
    required this.keyBoardType,
  });
  final String title;
  final Function(String)? onChanged;
  final TextInputType keyBoardType;
  @override
  State<CustomAddAddressField> createState() => _CustomEditTextFieldState();
}

class _CustomEditTextFieldState extends State<CustomAddAddressField> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        textSelectionTheme: const TextSelectionThemeData(
          selectionColor: Color.fromARGB(255, 168, 68, 72),
          selectionHandleColor: Color(0xffAE1F24),
        ),
      ),
      child: TextFormField(
        keyboardType: widget.keyBoardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This Field Is Required';
          }
          return null;
        },
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.secondaryColorTheme,
          focusColor: AppColors.mainColorTheme,
          focusedBorder: customOutlineBorder(),
          enabledBorder: customOutlineBorder(),
          border: customOutlineBorder(),
          hintText: widget.title,
          labelStyle: const TextStyle(
            color: AppColors.mainColorTheme,
          ),
        ),
        cursorColor: AppColors.mainColorTheme,
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
