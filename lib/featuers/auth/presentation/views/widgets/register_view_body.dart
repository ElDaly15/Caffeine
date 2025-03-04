import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm.dart';
import 'package:caffeine/core/widgets/buttons/text_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:caffeine/featuers/auth/presentation/manager/create_user_cubit/create_user_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterViewBody extends StatefulWidget {
  const RegisterViewBody({super.key});

  @override
  State<RegisterViewBody> createState() => _RegisterViewBodyState();
}

class _RegisterViewBodyState extends State<RegisterViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? email, password, fName;
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
                  S.of(context).create_account,
                  style: TextStyles.font24Bold(context)
                      .copyWith(color: AppColors.whiteColorFirst, fontSize: 28),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                child: Text(
                  S.of(context).welcome_message_register,
                  style: TextStyles.font20Bold(context).copyWith(
                    color: AppColors.whiteColorFirst,
                  ),
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
                isInLogin: false,
                hintTitle: S.of(context).email,
                isPassword: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.024,
              ),
              CustomTextField(
                onChanged: (value) {
                  fName = value;
                },
                isObscureText: false,
                hintTitle: S.of(context).full_name,
                isPassword: false,
                isInLogin: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.024,
              ),
              CustomTextField(
                isInLogin: false,
                onChanged: (value) {
                  password = value;
                },
                isObscureText: true,
                hintTitle: S.of(context).password,
                isPassword: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              BigElevatedBtm(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      await BlocProvider.of<CreateUserCubit>(context)
                          .createUserWithEmailAndPassword(
                              email!, password!, fName!);
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: S.of(context).sign_up),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              TextBtm(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: S.of(context).already_have_account),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
