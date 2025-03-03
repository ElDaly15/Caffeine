import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/my_orders_view.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/personal_information.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/settings_section_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/shipping_address_view.dart';
import 'package:caffeine/featuers/settings/whishlist/presentation/views/whishlist_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore: unused_import
import 'package:get/get.dart' as g;

class ContainerOfListTileSettings extends StatelessWidget {
  const ContainerOfListTileSettings({super.key});

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
            icon: Icons.person,
            title: S.of(context).personal_information,
            onTap: () {
              g.Get.to(() => const PersonalInformation(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
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
            icon: FontAwesomeIcons.box,
            title: S.of(context).my_orders,
            onTap: () {
              g.Get.to(() => const MyOrdersView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
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
            icon: FontAwesomeIcons.solidHeart,
            title: S.of(context).wishlist,
            onTap: () {
              g.Get.to(() => const WhishlistView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
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
            icon: Icons.local_shipping,
            title: S.of(context).shipping_address,
            onTap: () {
              g.Get.to(() => const ShippingAddressView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
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
            icon: Icons.settings,
            title: S.of(context).settings,
            onTap: () {
              g.Get.to(() => const SettingsSectionView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
            },
          ),
        ],
      ),
    );
  }
}
