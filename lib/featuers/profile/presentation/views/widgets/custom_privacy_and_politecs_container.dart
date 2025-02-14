import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart' as g;

class CustomPrivacyAndPolitecsContainer extends StatelessWidget {
  const CustomPrivacyAndPolitecsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 16),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.secondaryColorTheme),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          CustomProfileListTile(
            statusOfNotification: false,
            onChangedSwitch: (value) {},
            hasSwitch: false,
            hasTrailling: false,
            icon: Icons.chat,
            title: 'Contact Us',
            onTap: () {
              // g.Get.to(() => const CustomerView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: false,
            onChangedSwitch: (value) {},
            hasSwitch: false,
            hasTrailling: false,
            icon: Icons.privacy_tip,
            title: 'Privacy & Policy',
            onTap: () {
              // g.Get.to(() => const PrivacyView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: false,
            onChangedSwitch: (value) {},
            hasSwitch: false,
            hasTrailling: false,
            icon: Icons.logout,
            title: 'Logout',
            onTap: () {
              // getIt<FireBaseServices>().signOut();
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (context) => const StartView()),
              //     (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
