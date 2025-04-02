import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/manager/delete_account_cubit/delete_account_cubit.dart';
import 'package:caffeine/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteConfirmDialog extends StatefulWidget {
  const DeleteConfirmDialog({super.key});

  @override
  State<DeleteConfirmDialog> createState() => _DeleteConfirmDialogState();
}

class _DeleteConfirmDialogState extends State<DeleteConfirmDialog> {
  String? deleteText;

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final dialogWidth = screenWidth > 600 ? 500.0 : screenWidth * 0.9;
    final dialogHeight = screenWidth > 600 ? 300.0 : 250.0;

    return Dialog(
      backgroundColor: Colors.white,
      child: SizedBox(
        width: dialogWidth,
        height: dialogHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).deleting_account,
                style: TextStyles.font18Bold(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                S.of(context).delete_warning,
                style: TextStyles.font14SemiBold(context),
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              Text(
                S.of(context).delete_confirmation,
                style: TextStyles.font18Bold(context).copyWith(
                  color: AppColors.mainColorTheme,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Flexible(
                    child: CustomTextField(
                      isObscureText: false,
                      hintTitle: S.of(context).delete_hint,
                      onChanged: (value) {
                        deleteText = value;
                      },
                      isPassword: false,
                      isInLogin: false,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: AppColors.mainColorTheme,
                    ),
                    onPressed: () async {
                      if (deleteText == 'DELETE') {
                        Navigator.pop(context);
                        BlocProvider.of<DeleteAccountCubit>(context)
                            .deleteAccount();
                      } else {
                        CustomSnackBar().showCustomSnackBar(
                          context: context,
                          message: S.of(context).delete_error,
                          type: AnimatedSnackBarType.error,
                        );
                      }
                    },
                    child: Text(
                      S.of(context).delete_account,
                      style: TextStyles.font14Medium(context).copyWith(
                        color: AppColors.secondaryColorTheme,
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
