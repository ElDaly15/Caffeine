import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/auth/presentation/manager/login_user_cubit/login_user_cubit.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/social_media_widget_login_and_reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowOfSocialMediaRegestiration extends StatelessWidget {
  const RowOfSocialMediaRegestiration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        ContainerOfSocialMedia(
          image: Assets.imagesGoogle,
          onTap: () async {
            await BlocProvider.of<LoginUserCubit>(context).signInWithGoogle();
          },
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
