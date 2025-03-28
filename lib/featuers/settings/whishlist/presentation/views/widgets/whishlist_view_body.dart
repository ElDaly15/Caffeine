import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/sliver_of_whishlist_loading.dart';
import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/sliver_list_of_whishlist_items.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class WhishlistViewBody extends StatelessWidget {
  const WhishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageFavouriteProductsCubit,
        ManageFavouriteProductsState>(
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is ManageFavouriteProductsLoading,
          // ignore: deprecated_member_use
          color: Colors.white.withOpacity(0.5),
          progressIndicator: CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: SafeArea(
                    child: SizedBox(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomHeaderWithTitleAndBackBtm(
                    title: S.of(context).wishlist,
                    color: Colors.black,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                BlocBuilder<GetUserDataCubit, GetUserDataState>(
                  builder: (context, state) {
                    if (state is GetUserDataSuccess) {
                      return state.userModel.favProducts.isEmpty
                          ? SliverFillRemaining(
                              hasScrollBody: false,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    Assets.imagesEmptyWhishlist,
                                    width: MediaQuery.of(context).size.width *
                                        0.55,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    S.of(context).whishlist_empty,
                                    style: TextStyles.font24SemiBold(context)
                                        .copyWith(
                                            color: AppColors.mainColorTheme),
                                  ),
                                ],
                              ),
                            )
                          : SliverListOfWhishListItem(
                              favProducts: state.userModel.favProducts,
                            );
                    } else if (state is GetUserDataLoading) {
                      return SliverOfWhishlistLoading();
                    } else {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: ErrorWidgetForCaffeineApp(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
