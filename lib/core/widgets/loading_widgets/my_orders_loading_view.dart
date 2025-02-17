import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/list_loading_of_orders.dart';
import 'package:flutter/material.dart';

class MyOrdersLoadingView extends StatelessWidget {
  const MyOrdersLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SafeArea(
            child: SizedBox(),
          ),
          const CustomHeaderWithTitleAndBackBtm(
            title: 'My Orders',
            color: Colors.black,
          ),
          const SizedBox(height: 15),
          Expanded(
              child:
                  ListLoadingOfOrders()), // If this widget doesn't rely on Slivers, it should work fine in a Column
        ],
      ),
    );
  }
}
