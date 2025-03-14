import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          color: AppColors.mainColorTheme,
        ),
        const CustomHeaderOfCaffeieApp(),
        Spacer(),
        Center(
            child: Image.asset(
          Assets.imagesEmptyCart,
          width: MediaQuery.of(context).size.width * 0.75,
        )),
        SizedBox(
          height: 10,
        ),
        Text(
          'Your cart is empty',
          style: TextStyles.font24SemiBold(context),
        ),
        Spacer(),
      ],
    );
  }
}
