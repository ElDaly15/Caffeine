import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:get/get.dart' as g;
import 'package:iconly/iconly.dart';

class ContainerOfSettingsSections extends StatefulWidget {
  const ContainerOfSettingsSections({super.key});

  @override
  State<ContainerOfSettingsSections> createState() =>
      _ContainerOfSettingsSectionsState();
}

class _ContainerOfSettingsSectionsState
    extends State<ContainerOfSettingsSections> {
  bool notification = false, darkMode = false;
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
            hasTrailling: true,
            icon: FontAwesomeIcons.earthAmericas,
            title: 'Select Language',
            onTap: () {
              // g.Get.to(() => const PersonalInformationView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: notification,
            onChangedSwitch: (value) {
              setState(() {
                notification = value;
              });
            },
            hasSwitch: true,
            hasTrailling: true,
            icon: IconlyBold.notification,
            title: 'Notifications',
            onTap: null,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: darkMode,
            onChangedSwitch: (value) {
              setState(() {
                darkMode = value;
              });
            },
            hasSwitch: true,
            hasTrailling: true,
            icon: FontAwesomeIcons.solidMoon,
            title: 'Dark Mode',
            onTap: null,
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: false,
            onChangedSwitch: (value) {},
            hasSwitch: false,
            hasTrailling: true,
            icon: IconlyBold.delete,
            title: 'Delete Account',
            onTap: () {
              // g.Get.to(() => const ShippingAddressView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
        ],
      ),
    );
  }
}
