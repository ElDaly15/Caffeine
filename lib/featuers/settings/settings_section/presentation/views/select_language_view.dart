import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/select_lanaguage_view_body.dart';
import 'package:flutter/material.dart';

class SelectLanguageView extends StatelessWidget {
  const SelectLanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SelectLanaguageViewBody(),
    );
  }
}
