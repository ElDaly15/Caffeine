import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/service/fire_base_services.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/presentation/views/get_started_view.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart' as g;

class CustomPrivacyAndPolitecsContainer extends StatelessWidget {
  const CustomPrivacyAndPolitecsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 16),
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
            title: S.of(context).contact_us,
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
            title: S.of(context).privacy_policy,
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
            title: S.of(context).logout,
            onTap: () {
              getIt<FireBaseServices>().signOut();
              g.Get.offAll(() => const GetStartedView(),
                  transition: g.Transition.fade,
                  duration: const Duration(milliseconds: 600));
            },
          ),
        ],
      ),
    );
  }
}
