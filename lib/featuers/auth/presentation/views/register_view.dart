import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
import 'package:caffeine/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/custom_register_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateUserCubit(getIt<AuthRepo>(), context),
      child: Scaffold(
        backgroundColor: AppColors.mainColorTheme,
        body: const CustomRegisterBlocConumser(),
      ),
    );
  }
}
