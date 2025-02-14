import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/container_of_settings_sections.dart';
import 'package:flutter/material.dart';

class SettingsSectionViewBody extends StatelessWidget {
  const SettingsSectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(child: SizedBox()),
          CustomHeaderWithTitleAndBackBtm(
              title: 'Settings', color: Colors.black),
          SizedBox(
            height: 15,
          ),
          ContainerOfSettingsSections(),
        ],
      ),
    );
  }
}
