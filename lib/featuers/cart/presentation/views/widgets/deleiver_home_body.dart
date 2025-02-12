import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/text_fields/text_field_of_copon.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_edit_address_and_add_note.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_payment_summary.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_coupon_applies.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_process_to_payment.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/row_of_price.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/your_order_list_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class DeleiverToHomeBody extends StatefulWidget {
  const DeleiverToHomeBody({super.key});

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
                    'Delivery Address',
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
                          editAddress: () {},
                          addNote: () {},
                        ),
                      ),
                    )
                  : SliverPadding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      sliver: SliverToBoxAdapter(
                        child: CustomBigElevatedBtmWithIcon(
                          onPressed: () {},
                          title: 'Add Address',
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
              YourOrdersListView(),
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
            ],
          ),
        ),
        ContainerOfProcessToPayment(
          onPressed: () {},
        ),
      ],
    );
  }
}
