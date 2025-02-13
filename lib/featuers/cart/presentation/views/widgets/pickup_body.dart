import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/text_fields/search_pick_up_cafe_text_field.dart';
import 'package:caffeine/core/widgets/text_fields/text_field_of_copon.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_payment_summary.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_coupon_applies.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_process_to_payment.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_with_icon_and_text.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/sliver_list_of_container_pick_up.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/your_order_list_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/payment_view.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class PickupBody extends StatefulWidget {
  const PickupBody({super.key});

  @override
  State<PickupBody> createState() => _PickupBodyState();
}

class _PickupBodyState extends State<PickupBody> {
  bool coponApplied = false;
  bool checkPickUp = false;

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
                    'Pickup From Cafe',
                    style: TextStyles.font20SemiBold(context),
                  ),
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
                    child: Row(
                      children: [
                        CustomContainerWithIconAndText(
                          title: 'Add Note',
                          iconData: IconlyLight.paper,
                          onTap: () {},
                        ),
                      ],
                    ),
                  )),
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
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
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
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    'Select Pickup Cafe',
                    style: TextStyles.font20SemiBold(context),
                  ),
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
                  child: SearchForPickUpCafeTextField(
                    onSubmitted: (value) {},
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverOfContainerOfPickUpCafe(
                onChanged: (value) {
                  setState(() {
                    checkPickUp = value;
                  });
                },
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        ),
        ContainerOfProcessToPayment(
          onPressed: checkPickUp
              ? () {
                  g.Get.to(() => const PaymentView(),
                      transition: g.Transition.fade,
                      duration: const Duration(milliseconds: 350));
                }
              : null,
        ),
      ],
    );
  }
}
