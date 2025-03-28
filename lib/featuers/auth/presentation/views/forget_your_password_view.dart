import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/forget_your_password_view_body.dart';
import 'package:flutter/material.dart';

class ForgetYourPasswordView extends StatelessWidget {
  const ForgetYourPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: const ForgetYourPasswordViewBody(),
    );
  }
}
