import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_cart_item.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 10,
            color: AppColors.mainColorTheme,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHeaderOfCaffeieApp(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Text(
              'My Cart',
              style: TextStyles.font24SemiBold(context),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: ContainerOfCartItem(
              counterOfProduct: (value) {},
              onSwiped: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}
