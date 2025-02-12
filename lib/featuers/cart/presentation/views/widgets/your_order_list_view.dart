import 'package:caffeine/featuers/cart/presentation/views/widgets/custom_order_item.dart';
import 'package:flutter/material.dart';

class YourOrdersListView extends StatelessWidget {
  const YourOrdersListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
            child: CustomOrderItem(delete: () {}),
          );
        });
  }
}
