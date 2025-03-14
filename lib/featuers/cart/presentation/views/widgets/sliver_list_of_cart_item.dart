import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_cart_item.dart';
import 'package:flutter/material.dart';

class SliverListOfCartItems extends StatelessWidget {
  const SliverListOfCartItems({super.key, required this.cartItems});

  final List<CartModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ContainerOfCartItem(
              cartModel: cartItems[index],
              counterOfProduct: (value) {},
              onSwiped: (value) {},
            ),
          );
        });
  }
}
