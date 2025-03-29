// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/buttons/icon_btm_of_edit.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/loading_profile_settings.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/manager/update_user_image/update_user_image_cubit.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/edit_information_data_view.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/avatar_of_user_with_edit_icon.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/container_of_user_info.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PersonalInformationBody extends StatefulWidget {
  const PersonalInformationBody({super.key});

  @override
  State<PersonalInformationBody> createState() =>
      _PersonalInformationBodyState();
}

class _PersonalInformationBodyState extends State<PersonalInformationBody> {
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserImageCubit, UpdateUserImageState>(
      listener: (context, state) {
        if (state is UpdateUserImageFailuer) {
          CustomSnackBar().showCustomSnackBar(
              context: context,
              message: S.of(context).edit_profile_image_error,
              type: AnimatedSnackBarType.error);
        }
        if (state is UpdateUserImageSuccess) {
          CustomSnackBar().showCustomSnackBar(
              context: context,
              message: S.of(context).edit_profile_image_success,
              type: AnimatedSnackBarType.success);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          color: Colors.white.withOpacity(0.5),
          inAsyncCall: state is UpdateUserImageLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                SafeArea(
                  child: SizedBox(),
                ),
                CustomHeaderWithTitleAndBackBtm(
                    title: S.of(context).personal_information,
                    color: Colors.black),
                SizedBox(
                  height: 15,
                ),
                BlocBuilder<GetUserDataCubit, GetUserDataState>(
                  builder: (context, state) {
                    if (state is GetUserDataSuccess) {
                      return Column(
                        children: [
                          AvatarOfUserImageWithEditIcon(
                            image: state.userModel.image,
                            onTap: () async {
                              final ImagePicker picker = ImagePicker();
                              final XFile? image = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                fileImage = File(image.path);
                                // ignore: use_build_context_synchronously
                                BlocProvider.of<UpdateUserImageCubit>(context)
                                    .updateUserImage(fileImage: fileImage);
                                setState(() {});
                              }
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            S.of(context).upload_image,
                            style: TextStyles.font20Bold(context),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ContainerOfUserInfo(
                            data: state.userModel.name,
                            icon: IconlyLight.user,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ContainerOfUserInfo(
                            data: state.userModel.email,
                            icon: IconlyLight.message,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconBtmOfEdit(
                              onPressed: () {
                                g.Get.to(
                                    () => EditInformationDataView(
                                          name: state.userModel.name,
                                        ),
                                    transition:
                                        g.Transition.leftToRightWithFade,
                                    duration:
                                        const Duration(milliseconds: 600));
                              },
                            ),
                          ),
                        ],
                      );
                    } else if (state is GetUserDataLoading) {
                      return LoadingProfileSettings();
                    } else {
                      return Expanded(child: ErrorWidgetForCaffeineApp());
                    }
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
