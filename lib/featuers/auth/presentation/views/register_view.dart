import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/register_view_body.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: const RegisterViewBody(),
    );
  }
}
