import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/settings/privacy_and_policy/presentation/views/widgets/privacy_view_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class PrivacyView extends StatelessWidget {
  const PrivacyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorTheme,
        iconTheme: const IconThemeData(color: AppColors.secondaryColorTheme),
        title: Text(S.of(context).privacy_policy,
            style: TextStyles.font22Medium(context)
                .copyWith(color: AppColors.secondaryColorTheme)),
      ),
      body: const PrivacyViewBody(),
    );
  }
}
