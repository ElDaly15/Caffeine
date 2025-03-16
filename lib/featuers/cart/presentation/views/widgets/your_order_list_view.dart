import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_cart/manage_cart_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_note/manage_note_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/custom_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourOrdersListView extends StatelessWidget {
  const YourOrdersListView({super.key, required this.cartItems});
  final List<CartModel> cartItems;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
            child: CustomOrderItem(
                cartModel: cartItems[index],
                delete: () {
                  if (cartItems.length == 1) {
                    BlocProvider.of<ManageNoteCubit>(context).addNote('');
                    BlocProvider.of<ManageCartCubit>(context).deleteCartItem(
                        productCode: cartItems[index].orderProductCode);
                    Navigator.pop(context);
                  } else {
                    BlocProvider.of<ManageCartCubit>(context).deleteCartItem(
                        productCode: cartItems[index].orderProductCode);
                  }
                }),
          );
        });
  }
}
