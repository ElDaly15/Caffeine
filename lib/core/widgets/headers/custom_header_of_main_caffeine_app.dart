import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomHeaderOfCaffeieApp extends StatelessWidget {
  const CustomHeaderOfCaffeieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.mainColorTheme,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            Assets.imagesLogoCaffeineErased,
            scale: 3,
          ),
        ],
      ),
    );
  }
}
