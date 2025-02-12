import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_edit_address_and_add_note.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_and_pick_up_check.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: SizedBox(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: CustomHeaderWithTitleAndBackBtm(
              color: Colors.black,
              title: 'Checkout',
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
            child: DeleiverAndPickUpCheck(
              onChanged: (index) {},
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
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          sliver: SliverToBoxAdapter(
            child: ColumnOfAddressAndEditAndAddNote(
              editAddress: () {},
              addNote: () {},
            ),
          ),
        ),
      ],
    );
  }
}
