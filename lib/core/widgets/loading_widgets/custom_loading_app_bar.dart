import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingAppBar extends StatelessWidget {
  const CustomLoadingAppBar({super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          'Detail',
          style: TextStyles.font20SemiBold(context).copyWith(),
        ),
        const Spacer(),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: IconButton(
            icon: const Icon(
              IconlyLight.heart,
              color: Colors.black,
            ),
            onPressed: onPressed,
          ),
        ),
      ],
    );
  }
}
