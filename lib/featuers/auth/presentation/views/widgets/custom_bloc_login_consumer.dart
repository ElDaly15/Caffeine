import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/login_view_body.dart';
import 'package:caffeine/featuers/home/presentation/views/home_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../manager/login_user_cubit/login_user_cubit.dart';

class CustomBlocLoginBodyConsumer extends StatelessWidget {
  const CustomBlocLoginBodyConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginUserCubit, LoginUserState>(
      listener: (context, state) {
        if (state is LoginUserSuccess) {
          g.Get.to(() => const HomeView(),
              transition: g.Transition.fade,
              duration: const Duration(milliseconds: 400));
        }
        if (state is LoginUserFailuer) {
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
          inAsyncCall: state is LoginUserLoading,
          child: const LoginViewBody(),
        );
      },
    );
  }
}
