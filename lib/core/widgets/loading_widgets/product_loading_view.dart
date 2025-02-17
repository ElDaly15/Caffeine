import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/loading_widgets/custom_loading_app_bar.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/container_of_price_and_add_to_cart.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/read_more_and_less_widget.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_of_product_details.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_size.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductLoadingView extends StatelessWidget {
  const ProductLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(
                      child: SizedBox(
                    height: 0,
                  )),
                  CustomLoadingAppBar(
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        Assets.imagesLatte,
                        fit: BoxFit.cover,
                        height: MediaQuery.of(context).size.height * 0.26,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Caffe Latte',
                          style: TextStyles.font24SemiBold(context)
                              .copyWith(fontSize: 28),
                        ),
                        RowOfContainersOfProductDetails(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: Text(
                      'Description',
                      style: TextStyles.font24SemiBold(context).copyWith(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Skeletonizer(
                      effect: ShimmerEffect(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        duration: const Duration(seconds: 1),
                      ),
                      enabled: true,
                      child: ReadMoreAndLessWidget()),
                  SizedBox(
                    height: 10,
                  ),
                  Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: Text(
                      'Size',
                      style: TextStyles.font24SemiBold(context).copyWith(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: RowOfContainerSizes(
                      onChangeSize: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            duration: const Duration(seconds: 1),
          ),
          enabled: true,
          child: ContainerOfPriceAndAddToCart(
            addToCart: () {},
          ),
        ),
      ],
    );
  }
}
