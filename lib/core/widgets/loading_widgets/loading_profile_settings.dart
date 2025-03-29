import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/icon_btm_of_edit.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/edit_information_data_view.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/avatar_of_user_with_edit_icon.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/container_of_user_info.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingProfileSettings extends StatelessWidget {
  const LoadingProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: Column(
        children: [
          AvatarOfUserImageWithEditIcon(
            image: 'https://example.com/image.jpg',
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).upload_image,
            style: TextStyles.font20Bold(context),
          ),
          SizedBox(
            height: 20,
          ),
          ContainerOfUserInfo(
            data: 'John Doe',
            icon: IconlyLight.user,
          ),
          SizedBox(
            height: 15,
          ),
          ContainerOfUserInfo(
            data: 'jYVtR@example.com',
            icon: IconlyLight.message,
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconBtmOfEdit(
              onPressed: () {
                g.Get.to(
                    () => const EditInformationDataView(
                          name: 'Mazen Ahmed',
                        ),
                    transition: g.Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 600));
              },
            ),
          )
        ],
      ),
    );
  }
}
