import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class GetStartedColumn extends StatelessWidget {
  const GetStartedColumn({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Text(
            'Fall in Love with Coffee in Blissful Delight!',
            style: TextStyles.font24SemiBold(context)
                .copyWith(color: AppColors.whiteColorFirst, fontSize: 34),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Welcome to our cozy coffee corner, where every cup is a delightful for you.',
            style:
                TextStyles.font18Medium(context).copyWith(color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          MaterialButton(
            minWidth: double.infinity,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: AppColors.mainColorTheme,
            onPressed: onPressed,
            child: Text(
              'Get Started',
              style: TextStyles.font18Medium(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
