// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/text_fields/text_field_of_copon.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/data/model/coupon_model.dart';
import 'package:caffeine/featuers/cart/presentation/manager/check_copoun/check_copoun_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/views/add_note_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/edit_note_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_edit_address_and_add_note.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_payment_summary.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_coupon_applies.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_process_to_payment.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/your_order_list_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/payment_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/add_address_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/edit_address_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class DeleiverToHomeBody extends StatefulWidget {
  const DeleiverToHomeBody(
      {super.key, required this.cartItems, required this.userModel});

  final List<CartModel> cartItems;

  final UserModel userModel;

  @override
  State<DeleiverToHomeBody> createState() => _DeleiverToHomeBodyState();
}

class _DeleiverToHomeBodyState extends State<DeleiverToHomeBody> {
  bool haveAddress = true;
  bool coponApplied = false;
  String copounValue = '';
  CouponModel? couponModel;

  @override
  Widget build(BuildContext context) {
    var totalPrice = widget.cartItems.fold<dynamic>(
      0.0,
      (sum, item) =>
          sum +
          (item.sizeEn == 'L'
              ? (double.parse(item.productPriceL) * item.quantity).toInt()
              : item.sizeEn == 'M'
                  ? (double.parse(item.productPriceM) * item.quantity).toInt()
                  : (double.parse(item.productPriceS) * item.quantity).toInt()),
    );
    num discountTotalPrice = totalPrice;
    if (couponModel != null) {
      discountTotalPrice =
          totalPrice - (totalPrice * (couponModel?.copounValue ?? 0));
    }
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).delivery_address,
                    style: TextStyles.font20SemiBold(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              widget.userModel.address.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      sliver: SliverToBoxAdapter(
                        child: ColumnOfAddressAndEditAndAddNote(
                          addressModel: widget.userModel.address[0],
                          title: widget.userModel.note == ''
                              ? S.of(context).add_note
                              : S.of(context).edit_note,
                          editAddress: () {
                            g.Get.to(
                                () => EditAddressView(
                                      addressModel: widget.userModel.address[0],
                                    ),
                                transition: g.Transition.fade,
                                duration: const Duration(milliseconds: 350));
                          },
                          addNote: () {
                            widget.userModel.note == ''
                                ? g.Get.to(() => const AddNoteView(),
                                    transition: g.Transition.fade,
                                    duration: const Duration(milliseconds: 350))
                                : g.Get.to(
                                    () => EditNoteView(
                                          note: widget.userModel.note,
                                        ),
                                    transition: g.Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 350));
                          },
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      sliver: SliverToBoxAdapter(
                        child: CustomBigElevatedBtmWithIcon(
                          onPressed: () {
                            g.Get.to(() => const AddAddressView(),
                                transition: g.Transition.fade,
                                duration: const Duration(milliseconds: 350));
                          },
                          title: S.of(context).add_address,
                          iconData: IconlyBold.plus,
                        ),
                      ),
                    ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  thickness: 1.5,
                  color: Color(0xffECECEC),
                  endIndent: 40,
                  indent: 40,
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              YourOrdersListView(
                cartItems: widget.cartItems,
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 5,
                  color: Color(0xffF9F2ED),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              BlocConsumer<CheckCopounCubit, CheckCopounState>(
                listener: (context, state) {
                  if (state is CheckCopounFailuer) {
                    CustomSnackBar().showCustomSnackBar(
                        context: context,
                        message: state.msg,
                        type: AnimatedSnackBarType.error);
                  } else if (state is CheckCopounSuccess) {
                    setState(() {
                      couponModel =
                          state.couponModel; // Update the coupon model
                      coponApplied = true; // Mark coupon as applied
                    });
                  }
                },
                builder: (context, state) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverToBoxAdapter(
                      child: coponApplied
                          ? ContainerOfCouponSuccessApplied(
                              onTap: () {
                                BlocProvider.of<CheckCopounCubit>(context)
                                    .emit(CheckCopounInitial());
                                setState(() {
                                  copounValue = '';
                                  coponApplied = false;
                                  couponModel = null; // Remove applied coupon
                                });
                              },
                            )
                          : CustomTextFieldOfCopons(
                              isLoading: state is CheckCopounLoading,
                              onSubmitted: (value) {
                                copounValue = value;
                              },
                              onPressed: () {
                                if (copounValue.isNotEmpty) {
                                  BlocProvider.of<CheckCopounCubit>(context)
                                      .checkCopoun(
                                          code: copounValue, context: context);
                                } else {
                                  CustomSnackBar().showCustomSnackBar(
                                      context: context,
                                      message: S.of(context).enter_copoun_code,
                                      type: AnimatedSnackBarType.error);
                                }
                              },
                            ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: ColumnOfPaymentSummary(
                    checkCoupon: coponApplied,
                    isDelivery: true,
                    cartItems: widget.cartItems,
                    coponModel: couponModel,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
            ],
          ),
        ),
        ContainerOfProcessToPayment(
            onPressed: widget.cartItems.isNotEmpty &&
                    widget.userModel.address.isNotEmpty
                ? () {
                    g.Get.to(
                        () => PaymentView(
                            userModel: widget.userModel,
                            orderStatus: 'Delivery',
                            totalPrice: (discountTotalPrice + 25.0).toInt()),
                        transition: g.Transition.fade,
                        duration: const Duration(milliseconds: 350));
                  }
                : null),
      ],
    );
  }
}
