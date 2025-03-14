import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/register_view_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomRegisterBlocConumser extends StatelessWidget {
  const CustomRegisterBlocConumser({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateUserCubit, CreateUserState>(
      listener: (context, state) {
        if (state is CreateUserSuccess) {
          Navigator.pop(context);
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: 'Account created successfully , Verify your email',
              type: AnimatedSnackBarType.warning);
        }
        if (state is CreateUserFailuer) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: state.message,
              type: AnimatedSnackBarType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          color: AppColors.mainColorTheme,
          progressIndicator: const CircularProgressIndicator(
            color: Colors.white,
          ),
          inAsyncCall: state is CreateUserLoading,
          child: const RegisterViewBody(),
        );
      },
    );
  }
}
