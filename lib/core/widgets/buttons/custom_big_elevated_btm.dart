import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomBigElvatedButtom extends StatelessWidget {
  const CustomBigElvatedButtom(
      {super.key,
      required this.colorCode,
      required this.colorOfTextCode,
      required this.title,
      required this.onPressed});

  final int colorCode, colorOfTextCode;
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(colorCode),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyles.font20SemiBold(context)
            .copyWith(color: Color(colorOfTextCode)),
      ),
    );
  }
}
