import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/custom_order_item_in_options.dart';
import 'package:flutter/material.dart';

class SliverListOfOrders extends StatelessWidget {
  const SliverListOfOrders({super.key, required this.orders});
  final List<OrderModel> orders;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomOrderItemInOptions(
                  orderModel: orders[index],
                ),
              ),
          childCount: orders.length),
    );
  }
}
