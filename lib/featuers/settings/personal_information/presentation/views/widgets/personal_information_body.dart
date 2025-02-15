import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/avatar_of_user_with_edit_icon.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/container_of_user_info.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PersonalInformationBody extends StatelessWidget {
  const PersonalInformationBody({super.key});

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
          AvatarOfUserImageWithEditIcon(
            onTap: () {},
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Upload Image',
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
        ],
      ),
    );
  }
}
