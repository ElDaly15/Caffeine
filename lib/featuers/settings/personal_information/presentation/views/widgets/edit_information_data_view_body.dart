// ignore_for_file: deprecated_member_use

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_edit_text_field.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditInformationDataViewBody extends StatefulWidget {
  const EditInformationDataViewBody({super.key, required this.name});
  final String name;

  @override
  State<EditInformationDataViewBody> createState() =>
      _EditInformationDataViewBodyState();
}

class _EditInformationDataViewBodyState
    extends State<EditInformationDataViewBody> {
  String? newName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          CustomSnackBar().showCustomSnackBar(
              context: context,
              message: S.of(context).edit_profile_name_success,
              type: AnimatedSnackBarType.success);
          Navigator.pop(context);
        } else if (state is EditProfileFailuer) {
          CustomSnackBar().showCustomSnackBar(
              context: context,
              message: S.of(context).edit_profile_name_error,
              type: AnimatedSnackBarType.error);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is EditProfileLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          color: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SafeArea(child: SizedBox()),
                CustomHeaderWithTitleAndBackBtm(
                    title: S.of(context).personal_information,
                    color: Colors.black),
                SizedBox(
                  height: 15,
                ),
                CustomEditTextField(
                  title: S.of(context).name,
                  onChanged: (value) {
                    newName = value;
                  },
                  textEditingController:
                      TextEditingController(text: newName ?? widget.name),
                  textInputType: TextInputType.text,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomBigElvatedButtom(
                    colorCode: 0xffC67C4E,
                    colorOfTextCode: 0xffFFFFFF,
                    title: S.of(context).save,
                    onPressed: () {
                      BlocProvider.of<EditProfileCubit>(context)
                          .editProfileName(name: newName ?? widget.name);
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
