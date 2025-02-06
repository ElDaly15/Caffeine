import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerOfSocialMedia extends StatelessWidget {
  const ContainerOfSocialMedia(
      {super.key, required this.image, required this.onTap});
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: const BoxDecoration(
          color: AppColors.whiteColorFirst,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: SvgPicture.asset(image),
      ),
    );
  }
}
