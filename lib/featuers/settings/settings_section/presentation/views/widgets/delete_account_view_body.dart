// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/auth/presentation/views/get_started_view.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/delete_account_list_tile.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/dialog_of_remove_account.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DeleteAccountViewBody extends StatelessWidget {
  const DeleteAccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => GetStartedView(),
            ),
          );
          getIt<CustomSnackBar>().showCustomSnackBar(
              // ignore: use_build_context_synchronously
              context: context,
              message: S.of(context).account_deleted_successfully,
              type: AnimatedSnackBarType.success);
        }
        if (state is DeleteAccountFailuer) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              // ignore: use_build_context_synchronously
              context: context,
              message: S.of(context).error_while_deleting_account,
              type: AnimatedSnackBarType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is DeleteAccountLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          color: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SafeArea(
                  child: SizedBox(),
                ),
                CustomHeaderWithTitleAndBackBtm(
                    title: S.of(context).delete_account, color: Colors.black),
                SizedBox(
                  height: 15,
                ),
                DeleteAccount(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteConfirmDialog();
                        });
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
