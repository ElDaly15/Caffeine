import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm.dart';
import 'package:caffeine/core/widgets/buttons/text_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:caffeine/featuers/auth/presentation/views/forget_your_password_view.dart';
import 'package:caffeine/featuers/auth/presentation/views/register_view.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/row_of_social_reg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              const SafeArea(
                child: SizedBox(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Center(
                child: Text(
                  'Login here',
                  style: TextStyles.font24Bold(context)
                      .copyWith(color: AppColors.whiteColorFirst, fontSize: 28),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  'Welcome back you\'ve been missed',
                  style: TextStyles.font20Bold(context)
                      .copyWith(color: AppColors.whiteColorFirst),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomTextField(
                onChanged: (value) {
                  email = value;
                },
                isObscureText: false,
                hintTitle: 'Email',
                isInLogin: true,
                isPassword: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.024,
              ),
              CustomTextField(
                isInLogin: true,
                onChanged: (value) {
                  password = value;
                },
                isObscureText: true,
                hintTitle: 'Password',
                isPassword: true,
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: CustomTextButtom(
                  onPressed: () {
                    g.Get.to(() => const ForgetYourPasswordView(),
                        transition: g.Transition.fade,
                        duration: const Duration(milliseconds: 400));
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              BigElevatedBtm(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'Sign In',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextBtm(
                onPressed: () {
                  g.Get.to(() => const RegisterView(),
                      transition: g.Transition.fade,
                      duration: const Duration(milliseconds: 800));
                },
                title: 'Create new account',
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                'Or continue with',
                style: TextStyles.font14SemiBold(context)
                    .copyWith(color: AppColors.secondaryColorTheme),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              const RowOfSocialMediaRegestiration(),
            ],
          ),
        ),
      ),
    );
  }
}
