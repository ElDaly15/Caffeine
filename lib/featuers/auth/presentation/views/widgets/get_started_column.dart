import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
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
            S.of(context).fall_in_love_with_coffee,
            style: TextStyles.font24SemiBold(context)
                .copyWith(color: AppColors.whiteColorFirst, fontSize: 34),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            S.of(context).welcome_message,
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
              S.of(context).get_started,
              style: TextStyles.font18Medium(context)
                  .copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
