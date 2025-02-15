import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class AvatarOfUserImageWithEditIcon extends StatelessWidget {
  const AvatarOfUserImageWithEditIcon({super.key, required this.onTap});
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            Assets.imagesLatte,
            scale: 2,
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
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
