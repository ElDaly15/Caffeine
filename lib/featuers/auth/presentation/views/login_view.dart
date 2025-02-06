import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColorTheme,
      body: const LoginViewBody(),
    );
  }
}
