import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/list_view_of_payment_gateways.dart';
import 'package:caffeine/generated/l10n.dart';
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
              title: S.of(context).payment, color: Colors.black),
          const SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).choose_payment_method,
            style: TextStyles.font20SemiBold(context),
          ),
          const SizedBox(
            height: 20,
          ),
          ListViewOfPaymentItems(onChanged: (valueOfPayment) {}),
          Spacer(),
          CustomBigElevatedBtmWithIcon(
              onPressed: () {},
              title: S.of(context).place_order,
              iconData: isArabic()
                  ? IconlyBold.arrow_left_2
                  : IconlyBold.arrow_right_2),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
