import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_text_field.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/payment/presentation/views/walltet_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class EnterNumberView extends StatefulWidget {
  const EnterNumberView({
    super.key,
    required this.price,
    required this.userModel,
    required this.orderStatus,
    this.branchModel,
  });
  final int price;
  final UserModel userModel;
  final String orderStatus;
  final BranchModel? branchModel;

  @override
  State<EnterNumberView> createState() => _EnterNumberViewState();
}

class _EnterNumberViewState extends State<EnterNumberView> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Form(
          key: _formKey,
          autovalidateMode: _autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SafeArea(
                child: SizedBox(),
              ),
              CustomHeaderWithTitleAndBackBtm(
                title: S.of(context).enter_number,
                color: Colors.black,
              ),
              const SizedBox(
                height: 14,
              ),
              const SizedBox(
                height: 14,
              ),
              CustomTextField(
                  type: TextInputType.number,
                  hintTitle: S.of(context).phone_number,
                  isObscureText: false,
                  onChanged: (value) {
                    number = value;
                    setState(() {});
                  },
                  isPassword: false,
                  isInLogin: false),
              const SizedBox(
                height: 14,
              ),
              CustomBigElvatedButtom(
                  colorCode: 0xffC67C4E,
                  colorOfTextCode: 0xffF1F1F1,
                  title: S.of(context).confirm,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WalltetView(
                            branchModel: widget.branchModel,
                            userModel: widget.userModel,
                            orderStatus: widget.orderStatus,
                            phoneNumber: number!,
                            tprice: widget.price,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        _autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
