import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: CustomHeaderOfCaffeieApp(),
        ),
      ],
    );
  }
}
