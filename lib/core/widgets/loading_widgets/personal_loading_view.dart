import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/icon_btm_of_edit.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/edit_information_data_view.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/avatar_of_user_with_edit_icon.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/container_of_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;
import 'package:skeletonizer/skeletonizer.dart';

class PersonalLoadingView extends StatelessWidget {
  const PersonalLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(),
          ),
          CustomHeaderWithTitleAndBackBtm(
              title: 'Personal Information', color: Colors.black),
          SizedBox(
            height: 15,
          ),
          Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: AvatarOfUserImageWithEditIcon(
              image: 'https://example.com/image.jpg',
              onTap: () {},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: Text(
              'Upload Image',
              style: TextStyles.font20Bold(context),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: ContainerOfUserInfo(
              data: 'John Doe',
              icon: IconlyLight.user,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: ContainerOfUserInfo(
              data: 'jYVtR@example.com',
              icon: IconlyLight.message,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              duration: const Duration(seconds: 1),
            ),
            enabled: true,
            child: Align(
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
            ),
          ),
        ],
      ),
    );
  }
}
