import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/container_of_product_details.dart';
import 'package:flutter/material.dart';

class RowOfContainersOfProductDetails extends StatelessWidget {
  const RowOfContainersOfProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ice/Hot',
          style: TextStyles.font18Medium(context).copyWith(color: Colors.grey),
        ),
        Spacer(),
        ContainerOfProductDetails(
          image: Assets.imagesDeleivry,
        ),
        SizedBox(
          width: 4,
        ),
        ContainerOfProductDetails(
          image: Assets.imagesBean,
        ),
        SizedBox(
          width: 4,
        ),
        ContainerOfProductDetails(
          image: Assets.imagesMilk,
        ),
      ],
    );
  }
}
