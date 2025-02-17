import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/core/widgets/loading_widgets/loading_view_of_cart_items.dart';
import 'package:caffeine/featuers/cart/presentation/views/checkout_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_total_price_and_checkout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:skeletonizer/skeletonizer.dart';

class CartViewLoading extends StatelessWidget {
  const CartViewLoading({super.key});
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
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(child: LoadingViewOfCartItems()),
            ],
          ),
        ),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: ContainerOfTotalPriceAndProcessCheckOut(
            onPressed: () {
              g.Get.to(() => const CheckoutView(),
                  transition: g.Transition.fade,
                  duration: const Duration(milliseconds: 400));
            },
          ),
        ),
      ],
    );
  }
}
