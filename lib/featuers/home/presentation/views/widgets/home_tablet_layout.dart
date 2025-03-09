import 'package:caffeine/core/service/get_user_data.dart';
import 'package:caffeine/core/widgets/loading_widgets/loding_list.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/custom_page_view_ads.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/custom_search_and_start_container.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/grid_view_of_products.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/row_of_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeTabletLayout extends StatefulWidget {
  const HomeTabletLayout({super.key});

  @override
  State<HomeTabletLayout> createState() => _HomeTabletLayoutState();
}

class _HomeTabletLayoutState extends State<HomeTabletLayout> {
  UserEntity? userModel;
  @override
  void initState() {
    super.initState();

    userModel = getUser();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ClampingScrollPhysics(),
      child: Column(
        children: [
          CustomSearchAndStartContainer(
            name: userModel?.name ?? '',
          ),
          SizedBox(
            height: 10,
          ),
          CustomPageViewOfAds(),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 55, child: RowOfCategoryItems()),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<GetProductsCubit, GetProductsState>(
            builder: (context, state) {
              if (state is GetProductsSuccess) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridViewOfProducts(
                    products: state.products,
                  ),
                );
              } else if (state is GetProductsFailuer) {
                return Center(
                  child: Text(state.error),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Skeletonizer(
                      effect: ShimmerEffect(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        duration: const Duration(seconds: 1),
                      ),
                      enabled: true,
                      child: GridViewOfProducts(
                        products: loadingList(),
                      )),
                );
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
