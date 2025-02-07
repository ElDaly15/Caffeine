import 'package:caffeine/featuers/home/presentation/views/widgets/custom_search_and_start_container.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/row_of_category_item.dart';
import 'package:flutter/material.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        CustomSearchAndStartContainer(),
        SizedBox(
          height: h < 680
              ? MediaQuery.of(context).size.height * 0.125
              : h >= 680 && h <= 800
                  ? MediaQuery.of(context).size.height * 0.119
                  : MediaQuery.of(context).size.height * 0.11,
        ),
        RowOfCategoryItems(),
      ],
    );
  }
}
