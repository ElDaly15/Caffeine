import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/whishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliverListOfWhishListItem extends StatelessWidget {
  const SliverListOfWhishListItem({super.key, required this.favProducts});
  final List<ProductModel> favProducts;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: WhishlistItem(
                  productModel: favProducts[index],
                  onSwiped: (value) {
                    BlocProvider.of<ManageFavouriteProductsCubit>(context)
                        .removeFavouriteProduct(
                            globalProductModel: favProducts[index]);
                  },
                ),
              ),
          childCount: favProducts.length),
    );
  }
}
