import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/card_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/enter_number_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/list_view_of_payment_gateways.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.totalPrice});
  final int totalPrice;
  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  String? valueOfPayment;
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
          ListViewOfPaymentItems(onChanged: (valueOfPayment) {
            this.valueOfPayment = valueOfPayment;
          }),
          Spacer(),
          CustomBigElevatedBtmWithIcon(
              onPressed: () {
                if (valueOfPayment == 'Card') {
                  g.Get.to(
                      () => CardView(
                            tprice: widget.totalPrice,
                          ),
                      transition: g.Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 600));
                } else if (valueOfPayment == 'Online Wallets') {
                  g.Get.to(
                      () => EnterNumberView(
                            price: widget.totalPrice,
                          ),
                      transition: g.Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 600));
                } else if (valueOfPayment == 'Cash') {
                  g.Get.off(() => HomeView(),
                      transition: g.Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 600));
                  CustomSnackBar().showCustomSnackBar(
                      context: context,
                      message: S.of(context).order_placed_success,
                      type: AnimatedSnackBarType.success);
                } else {
                  CustomSnackBar().showCustomSnackBar(
                      context: context,
                      message: S.of(context).selectMethod,
                      type: AnimatedSnackBarType.warning);
                }
              },
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
