import 'package:caffeine/featuers/product/presentation/views/widgets/product_view_body.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductViewBody(),
    );
  }
}
