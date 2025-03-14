import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/service/get_user_data.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/loading_widgets/loding_list.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:caffeine/featuers/cart/presentation/manager/add_item_to_cart/add_item_to_cart_cubit.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_ads/get_ads_cubit.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/custom_page_view_ads.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/custom_search_and_start_container.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/grid_view_of_products.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/row_of_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
    return BlocConsumer<AddItemToCartCubit, AddItemToCartState>(
      listener: (context, state) {
        if (state is AddItemToCarSuccess) {
          CustomSnackBar().showCustomSnackBar(
            context: context,
            message: 'Item added to cart successfully',
            type: AnimatedSnackBarType.success,
          );
        }

        if (state is AddItemToCartFailuer) {
          CustomSnackBar().showCustomSnackBar(
            context: context,
            message: 'An error occurred while adding item to cart',
            type: AnimatedSnackBarType.error,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddItemToCartLoading,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.2),
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                CustomSearchAndStartContainer(
                  name: userModel?.name ?? '',
                ),
                SizedBox(
                  height: 10,
                ),
                BlocBuilder<GetAdsCubit, GetAdsState>(
                  builder: (context, state) {
                    if (state is GetAdsSuccess) {
                      return CustomPageViewOfAds(ads: state.ads);
                    } else if (state is GetAdsFailuer) {
                      return ErrorWidgetForCaffeineApp();
                    } else {
                      return Skeletonizer(
                          effect: ShimmerEffect(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            duration: const Duration(seconds: 1),
                          ),
                          enabled: true,
                          child: CustomPageViewOfAds(ads: loadingListAds()));
                    }
                  },
                ),
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
                      return ErrorWidgetForCaffeineApp();
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
          ),
        );
      },
    );
  }
}
