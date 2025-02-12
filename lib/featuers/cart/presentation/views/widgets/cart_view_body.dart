import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_total_price_and_checkout.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/sliver_list_of_cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          color: AppColors.mainColorTheme,
        ),
        const CustomHeaderOfCaffeieApp(),
        Expanded(
          // This fixes the issue
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: SizedBox(
                height: 10,
              )),
              SliverListOfCartItems(),
            ],
          ),
        ),
        ContainerOfTotalPriceAndProcessCheckOut(
          onPressed: () {},
        ),
      ],
    );
  }
}
