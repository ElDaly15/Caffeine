import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:flutter/material.dart';

class ForgetYourPasswordViewBody extends StatefulWidget {
  const ForgetYourPasswordViewBody({super.key});

  @override
  State<ForgetYourPasswordViewBody> createState() =>
      _ForgetYourPasswordViewBodyState();
}

class _ForgetYourPasswordViewBodyState
    extends State<ForgetYourPasswordViewBody> {
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
            child: const CustomHeaderWithTitleAndBackBtm(
              color: Colors.white,
              title: 'Forgot Your Password ',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Text(
              'Don\'t worry, just write your email and we will send you a link to reset your password.',
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
              hintTitle: 'Email',
              isInLogin: true,
              isPassword: false,
              isObscureText: false,
              onChanged: (value) {},
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
              title: 'Reset Password',
              onPressed: () async {
                if (formKeyPasswordEdit.currentState!.validate()) {
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
