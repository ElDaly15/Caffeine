import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
import 'package:caffeine/featuers/auth/presentation/manager/login_user_cubit/login_user_cubit.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/custom_bloc_login_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginUserCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        backgroundColor: AppColors.mainColorTheme,
        body: const CustomBlocLoginBodyConsumer(),
      ),
    );
  }
}
