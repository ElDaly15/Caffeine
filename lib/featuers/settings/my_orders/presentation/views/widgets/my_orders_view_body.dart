import 'package:caffeine/core/errors/error_with_back_btm.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/my_orders_loading_view.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/sliver_list_of_orders.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrdersViewBody extends StatelessWidget {
  const MyOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: BlocBuilder<GetUserDataCubit, GetUserDataState>(
        builder: (context, state) {
          if (state is GetUserDataSuccess) {
            return CustomScrollView(
              physics: const ClampingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(
                  child: SafeArea(
                    child: SizedBox(),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CustomHeaderWithTitleAndBackBtm(
                    title: S.of(context).my_orders,
                    color: Colors.black,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                state.userModel.orders.isEmpty
                    ? SliverFillRemaining(
                        hasScrollBody: false,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.imagesEmptyOrders,
                              width: MediaQuery.of(context).size.width * 0.7,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              S.of(context).no_orders_yet,
                              style: TextStyles.font24SemiBold(context)
                                  .copyWith(color: AppColors.mainColorTheme),
                            ),
                          ],
                        ),
                      )
                    : SliverListOfOrders(orders: state.userModel.orders)
              ],
            );
          } else if (state is GetUserDataLoading) {
            return MyOrdersLoadingView();
          } else {
            return CustomErrorWithHeaderAndBackBtm(
              title: S.of(context).error_occurred,
            );
          }
        },
      ),
    );
  }
}
