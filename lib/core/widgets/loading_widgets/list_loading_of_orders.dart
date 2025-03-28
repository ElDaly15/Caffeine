import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/custom_order_item_in_options.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListLoadingOfOrders extends StatelessWidget {
  const ListLoadingOfOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 16),
        itemCount: 5, // You can replace this with the actual number of orders
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: CustomOrderItemInOptions(
              orderModel: OrderModel(
                  date: '2024',
                  totalPrice: 150,
                  orderId: '2323S',
                  paymentMethod: 'ASDASD',
                  orderedBy: 'ASDSAD',
                  statusOfOrder: 'ASDASD',
                  stepperValue: 1,
                  note: 'ASDASD',
                  userId: 'ASDASDSD',
                  products: []),
            ),
          );
        },
      ),
    );
  }
}
