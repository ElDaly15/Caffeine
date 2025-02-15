import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/custom_order_item_in_options.dart';
import 'package:flutter/material.dart';

class SliverListOfOrders extends StatelessWidget {
  const SliverListOfOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomOrderItemInOptions(),
              ),
          childCount: 5),
    );
  }
}
