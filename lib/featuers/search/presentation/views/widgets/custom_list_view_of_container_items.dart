import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine/featuers/product/presentation/views/product_view.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/container_of_search_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;

class CustomListViewOfContainerItems extends StatelessWidget {
  const CustomListViewOfContainerItems({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 16, right: 16),
            child: GestureDetector(
              onTap: () {
                BlocProvider.of<GetProductByCodeCubit>(context)
                    .getProductByCode(code: products[index].productCode);
                g.Get.to(() => const ProductView(),
                    transition: g.Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 600));
              },
              child: ContainerOfSearchItem(
                productModel: products[index],
              ),
            ),
          );
        });
  }
}
