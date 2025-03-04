// ignore_for_file: use_build_context_synchronously

import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/service/fire_base_services.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgetYourPasswordViewBody extends StatefulWidget {
  const ForgetYourPasswordViewBody({super.key});

  @override
  State<ForgetYourPasswordViewBody> createState() =>
      _ForgetYourPasswordViewBodyState();
}

class _ForgetYourPasswordViewBodyState
    extends State<ForgetYourPasswordViewBody> {
  String? email;
  var formKeyPasswordEdit = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKeyPasswordEdit,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CustomHeaderWithTitleAndBackBtm(
              color: Colors.white,
              title: S.of(context).forgot_your_password,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              S.of(context).forgot_password_message,
              style: TextStyles.font18SemiBold(context)
                  .copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomTextField(
              hintTitle: S.of(context).email,
              isInLogin: true,
              isPassword: false,
              isObscureText: false,
              onChanged: (value) {
                email = value;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomBigElvatedButtom(
              colorCode: 0xff411900,
              colorOfTextCode: 0xffffffff,
              title: S.of(context).reset_password,
              onPressed: () async {
                if (formKeyPasswordEdit.currentState!.validate()) {
                  await getIt<FireBaseServices>()
                      .sendPasswordResetEmail(email!, context);
                  Navigator.pop(context);
                  FocusScope.of(context).unfocus();
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
