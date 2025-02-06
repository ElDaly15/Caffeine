import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/social_media_widget_login_and_reg.dart';
import 'package:flutter/material.dart';

class RowOfSocialMediaRegestiration extends StatelessWidget {
  const RowOfSocialMediaRegestiration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ContainerOfSocialMedia(
          image: Assets.imagesGoogle,
          onTap: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        ContainerOfSocialMedia(
          image: Assets.imagesFacebook,
          onTap: () {},
        ),
        const SizedBox(
          width: 10,
        ),
        ContainerOfSocialMedia(
          image: Assets.imagesApple,
          onTap: () {},
        ),
        const Spacer(),
      ],
    );
  }
}
