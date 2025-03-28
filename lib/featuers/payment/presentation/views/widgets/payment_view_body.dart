import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:caffeine/featuers/payment/presentation/manager/add_order/add_order_cubit.dart';
import 'package:caffeine/featuers/payment/presentation/views/card_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/enter_number_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/list_view_of_payment_gateways.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody(
      {super.key,
      required this.totalPrice,
      required this.userModel,
      required this.orderStatus,
      this.branchModel});
  final int totalPrice;
  final BranchModel? branchModel;

  final UserModel userModel;
  final String orderStatus;
  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  String? valueOfPayment;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailuer) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: S.of(context).order_placed_error,
              type: AnimatedSnackBarType.error);
        }

        if (state is AddOrderSuccess) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: S.of(context).order_placed_success,
              type: AnimatedSnackBarType.success);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.5),
          child: Padding(
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
                                  branchModel: widget.branchModel,
                                  userModel: widget.userModel,
                                  orderStatus: widget.orderStatus,
                                  tprice: widget.totalPrice,
                                ),
                            transition: g.Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 600));
                      } else if (valueOfPayment == 'Online Wallets') {
                        g.Get.to(
                            () => EnterNumberView(
                                  branchModel: widget.branchModel,
                                  userModel: widget.userModel,
                                  orderStatus: widget.orderStatus,
                                  price: widget.totalPrice,
                                ),
                            transition: g.Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 600));
                      } else if (valueOfPayment == 'Cash') {
                        var orderId = Uuid();
                        OrderModel orderModel = OrderModel(
                          branchModel: widget.branchModel,
                          totalPrice: widget.totalPrice,
                          orderId: orderId.v4(),
                          statusOfOrder: 'Pending',
                          date: FieldValue.serverTimestamp(),
                          userId: widget.userModel.uid,
                          stepperValue: 0,
                          orderedBy: widget.orderStatus,
                          paymentMethod: 'Cash On Delivery',
                          products: widget.userModel.cartItems,
                          note: widget.userModel.note,
                        );

                        BlocProvider.of<AddOrderCubit>(context)
                            .addOrder(orderModel: orderModel);
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
          ),
        );
      },
    );
  }
}
