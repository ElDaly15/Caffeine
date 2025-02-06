import 'package:caffeine/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';

class CustomHeaderWithTitleAndBackBtm extends StatelessWidget {
  const CustomHeaderWithTitleAndBackBtm({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyles.font20SemiBold(context)
              .copyWith(color: AppColors.whiteColorFirst),
        ),
        const Spacer(),
      ],
    );
  }
}
