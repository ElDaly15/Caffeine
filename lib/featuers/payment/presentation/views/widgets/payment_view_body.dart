import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/list_view_of_payment_gateways.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            child: SizedBox(),
          ),
          CustomHeaderWithTitleAndBackBtm(
              title: 'Payment', color: Colors.black),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Choose Your Payment Method',
            style: TextStyles.font20SemiBold(context),
          ),
          const SizedBox(
            height: 20,
          ),
          ListViewOfPaymentItems(onChanged: (valueOfPayment) {}),
          Spacer(),
          CustomBigElevatedBtmWithIcon(
              onPressed: () {},
              title: 'Place Order',
              iconData: IconlyBold.arrow_right_2),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
