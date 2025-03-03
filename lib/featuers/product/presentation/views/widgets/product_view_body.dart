import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/container_of_price_and_add_to_cart.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/custom_product_header.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/read_more_and_less_widget.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_of_product_details.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_size.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

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
                  CustommProductAppBarWithWhishlistTheItems(
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      Assets.imagesLatte,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: double.infinity,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
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
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).description,
                    style: TextStyles.font24SemiBold(context).copyWith(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ReadMoreAndLessWidget(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    S.of(context).size,
                    style: TextStyles.font24SemiBold(context).copyWith(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RowOfContainerSizes(
                    onChangeSize: (value) {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        ContainerOfPriceAndAddToCart(
          addToCart: () {},
        ),
      ],
    );
  }
}
