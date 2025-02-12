import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_cart_item.dart';
import 'package:flutter/material.dart';

class SliverListOfCartItems extends StatelessWidget {
  const SliverListOfCartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ContainerOfCartItem(
              counterOfProduct: (value) {},
              onSwiped: (value) {},
            ),
          );
        });
  }
}
