import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/settings_section_view_body.dart';
import 'package:flutter/material.dart';

class SettingsSectionView extends StatelessWidget {
  const SettingsSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SettingsSectionViewBody(),
    );
  }
}
