import 'package:caffeine/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class IconBtmOfEdit extends StatelessWidget {
  const IconBtmOfEdit({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: AppColors.mainColorTheme,
      ),
      onPressed: onPressed,
      icon: Icon(
        IconlyLight.edit,
        color: Colors.white,
      ),
    );
  }
}
