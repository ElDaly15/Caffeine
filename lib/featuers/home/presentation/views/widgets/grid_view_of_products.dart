import 'package:caffeine/featuers/home/presentation/views/widgets/container_of_product.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:flutter/material.dart';

class GridViewOfProducts extends StatelessWidget {
  const GridViewOfProducts({super.key, required this.products});
  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(0),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: w >= 800 && w < 1200
            ? 3
            : w >= 1200
                ? 4
                : 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: w <= 400
            ? 2 / 3.3
            : w > 400 && w < 700
                ? 2.4 / 3.75
                : w >= 700 && w < 1200
                    ? 2.4 / 3.5
                    : 2.4 / 3.4,
      ),
      itemBuilder: (context, index) {
        return ContainerOfProduct(
          productModel: products[index],
        );
      },
    );
  }
}
