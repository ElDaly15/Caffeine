import 'package:caffeine/featuers/home/presentation/views/widgets/custom_page_view_ads.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/custom_search_and_start_container.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/grid_view_of_products.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/row_of_category_item.dart';
import 'package:flutter/material.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          CustomSearchAndStartContainer(),
          SizedBox(
            height: 10,
          ),
          CustomPageViewOfAds(),
          SizedBox(
            height: 10,
          ),
          RowOfCategoryItems(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GridViewOfProducts(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
