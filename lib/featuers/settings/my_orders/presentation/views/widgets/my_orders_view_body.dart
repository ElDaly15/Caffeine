import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/sliver_list_of_orders.dart';
import 'package:flutter/material.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: SizedBox(),
            ),
          ),
          const SliverToBoxAdapter(
            child: CustomHeaderWithTitleAndBackBtm(
              title: 'My Orders',
              color: Colors.black,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverListOfOrders(),
        ],
      ),
    );
  }
}
