import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/avatar_of_user_with_edit_icon.dart';
import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
