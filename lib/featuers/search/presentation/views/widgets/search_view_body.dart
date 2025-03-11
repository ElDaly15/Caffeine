import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/custom_list_view_of_container_items.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key, required this.searchValue});
  final String searchValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                S.of(context).search_result,
                style: TextStyles.font22SemiBold(context),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          BlocBuilder<SearchProductsCubit, SearchProductsState>(
            builder: (context, state) {
              if (state is SearchProductsSuccess) {
                if (state.prodcutsSearched.isEmpty || searchValue.isEmpty) {
                  return searchValue.isNotEmpty
                      ? SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesEmptyOrders,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  S.of(context).no_result_found,
                                  style: TextStyles.font24SemiBold(context),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SliverFillRemaining(
                          hasScrollBody: false,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.imagesStartsearch,
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                ),
                                const SizedBox(
                                  height: 39,
                                ),
                                Text(
                                  S.of(context).start_searching,
                                  style: TextStyles.font24SemiBold(context),
                                ),
                              ],
                            ),
                          ),
                        );
                } else {
                  return CustomListViewOfContainerItems(
                      products: state.prodcutsSearched);
                }
              } else if (state is SearchProductsFailuer) {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: ErrorWidgetForCaffeineApp(),
                );
              } else if (state is SearchProductsLoading) {
                return SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColorTheme,
                    ),
                  ),
                );
              } else {
                return SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.imagesStartsearch,
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                        const SizedBox(
                          height: 39,
                        ),
                        Text(
                          S.of(context).start_searching,
                          style: TextStyles.font24SemiBold(context),
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
