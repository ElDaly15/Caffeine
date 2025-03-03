import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_and_pick_up_check.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_home_body.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/pickup_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: CustomHeaderWithTitleAndBackBtm(
            color: Colors.black,
            title: S.of(context).checkout,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: DeleiverAndPickUpCheck(
            onChanged: (index) {
              pageController.jumpToPage(index);
            },
          ),
        ),
        Expanded(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              DeleiverToHomeBody(),
              PickupBody(),
            ],
          ),
        ),
      ],
    );
  }
}
