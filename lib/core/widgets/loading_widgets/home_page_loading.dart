import 'package:caffeine/core/widgets/loading_widgets/page_loading_of_ads.dart';
import 'package:caffeine/core/widgets/loading_widgets/search_and_start_loading.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/grid_view_of_products.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/row_of_category_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          SearchAndStartLoading(),
          SizedBox(
            height: 10,
          ),
          PageLoadingOfAds(),
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
              child: RowOfCategoryItems()),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  duration: const Duration(seconds: 1),
                ),
                enabled: true,
                child: GridViewOfProducts()),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
