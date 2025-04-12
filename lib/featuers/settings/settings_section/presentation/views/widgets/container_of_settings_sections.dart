import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/notification/data/notification_helper/firebase_notification.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_profile_list_tile.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/delete_account_view.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/select_language_view.dart';
import 'package:caffeine/generated/l10n.dart';
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
  @override
  void initState() {
    super.initState();
    _loadNotificationStatus();
  }

  Future<void> _loadNotificationStatus() async {
    notification = await CacheHelper().getData(key: 'notificationsEnabled');

    setState(() {});
  }

  bool? notification, darkMode = false;
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
            title: S.of(context).select_language,
            onTap: () {
              g.Get.to(() => const SelectLanguageView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
            },
          ),
          const SizedBox(
            height: 8,
          ),
          CustomProfileListTile(
            statusOfNotification: notification ?? false,
            onChangedSwitch: (value) async {
              notification = value;
              await NotificationService.instance.toggleNotifications(value);
              await _loadNotificationStatus();
              setState(() {});
            },
            hasSwitch: true,
            hasTrailling: true,
            icon: IconlyBold.notification,
            title: S.of(context).notification,
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
            title: S.of(context).delete_account,
            onTap: () {
              g.Get.to(() => const DeleteAccountView(),
                  transition: g.Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 600));
            },
          ),
        ],
      ),
    );
  }
}
