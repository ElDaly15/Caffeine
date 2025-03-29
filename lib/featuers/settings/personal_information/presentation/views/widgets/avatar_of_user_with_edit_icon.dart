import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AvatarOfUserImageWithEditIcon extends StatelessWidget {
  const AvatarOfUserImageWithEditIcon(
      {super.key, required this.onTap, required this.image});
  final void Function() onTap;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            placeholder: (context, url) => Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                duration: const Duration(seconds: 1),
              ),
              enabled: true,
              child: Image.asset(
                Assets.imagesLatte,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            errorWidget: (context, url, error) => Skeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                duration: const Duration(seconds: 1),
              ),
              enabled: false,
              child: Image.asset(
                Assets.imagesPlaceholderImage,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            imageUrl: image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: -8,
          right: -5,
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.24),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: const Icon(
                IconlyLight.edit,
                size: 20,
                color: AppColors.mainColorTheme,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
