import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/custom_product_header.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/read_more_and_less_widget.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_of_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  style:
                      TextStyles.font24SemiBold(context).copyWith(fontSize: 28),
                ),
                RowOfContainersOfProductDetails(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Description',
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
              'Size',
              style: TextStyles.font24SemiBold(context).copyWith(),
            ),
            SizedBox(
              height: 10,
            ),
            ContainerOfSize(),
          ],
        ),
      ),
    );
  }
}

class ContainerOfSize extends StatelessWidget {
  const ContainerOfSize({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          'S',
          style: TextStyles.font18SemiBold(context),
        ),
      ),
    );
  }
}

class RowOfContainerSizes extends StatelessWidget {
  const RowOfContainerSizes({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
