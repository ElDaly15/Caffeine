// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_note/manage_note_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/add_note_view_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddNoteView extends StatelessWidget {
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<ManageNoteCubit, ManageNoteState>(
          listener: (context, state) {
            if (state is ManageNoteAddOrUpdateSuccess) {
              Navigator.pop(context);
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).note_added_success,
                  type: AnimatedSnackBarType.success);
            }

            if (state is ManageNoteAddOrUpdateFailuer) {
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).note_add_error,
                  type: AnimatedSnackBarType.error);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is ManageNoteAddOrUpdateLoading,
                color: Colors.white.withOpacity(0.5),
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.mainColorTheme,
                ),
                child: AddNoteViewBody());
          },
        ),
      ),
    );
  }
}
