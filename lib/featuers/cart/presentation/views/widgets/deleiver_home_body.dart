import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/text_fields/text_field_of_copon.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
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
  @override
  Widget build(BuildContext context) {
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
              haveAddress
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      sliver: SliverToBoxAdapter(
                        child: ColumnOfAddressAndEditAndAddNote(
                          title: widget.userModel.note == ''
                              ? S.of(context).add_note
                              : S.of(context).edit_note,
                          editAddress: () {
                            g.Get.to(() => const EditAddressView(),
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: coponApplied
                      ? ContainerOfCouponSuccessApplied()
                      : CustomTextFieldOfCopons(
                          onSubmitted: (value) {},
                          onPressed: () {
                            setState(() {
                              coponApplied = true;
                            });
                          },
                        ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: ColumnOfPaymentSummary(),
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
            onPressed: widget.cartItems.isNotEmpty
                ? () {
                    g.Get.to(() => const PaymentView(),
                        transition: g.Transition.fade,
                        duration: const Duration(milliseconds: 350));
                  }
                : null),
      ],
    );
  }
}
