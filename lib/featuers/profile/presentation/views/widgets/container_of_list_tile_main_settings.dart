import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/shipping_address_view.dart';
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
            icon: Icons.person,
            title: 'Personal Information',
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
            icon: FontAwesomeIcons.box,
            title: 'My Orders',
            onTap: () {
              // g.Get.to(() => const OrdersView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            icon: FontAwesomeIcons.solidHeart,
            title: 'Whishlist',
            onTap: () {
              // g.Get.to(() => const WhishlistView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            icon: Icons.local_shipping,
            title: 'Shipping Address',
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
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              // g.Get.to(() => const SettingsView(),
              //     transition: g.Transition.leftToRightWithFade,
              //     duration: const Duration(milliseconds: 600));
            },
          ),
        ],
      ),
    );
  }
}
