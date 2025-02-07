import 'package:caffeine/featuers/home/presentation/views/widgets/container_of_product.dart';
import 'package:flutter/material.dart';

class GridViewOfProducts extends StatelessWidget {
  const GridViewOfProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;

    return AspectRatio(
      aspectRatio: w <= 400
          ? 2 / 3.29
          : w >= 400 && w <= 800
              ? 2.4 / 3.9
              : 2.4 / 3.1,
      child: GridView.builder(
          padding: const EdgeInsets.all(0),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
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
            return ContainerOfProduct();
          }),
    );
  }
}
