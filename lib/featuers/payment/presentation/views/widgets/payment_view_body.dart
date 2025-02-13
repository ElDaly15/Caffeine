import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:flutter/material.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: SizedBox(),
        ),
        CustomHeaderWithTitleAndBackBtm(title: 'Payment', color: Colors.black),
      ],
    );
  }
}
