import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/skeltonizer_of_page_view_of_checkout.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_and_pick_up_check.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_home_body.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/pickup_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: SizedBox(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: CustomHeaderWithTitleAndBackBtm(
            color: Colors.black,
            title: S.of(context).checkout,
          ),
        ),
        BlocBuilder<GetUserDataCubit, GetUserDataState>(
          builder: (context, state) {
            if (state is GetUserDataSuccess) {
              return Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22),
                      child: DeleiverAndPickUpCheck(
                        onChanged: (index) {
                          pageController.jumpToPage(index);
                        },
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: pageController,
                        children: [
                          DeleiverToHomeBody(
                            userModel: state.userModel,
                            cartItems: state.userModel.cartItems,
                          ),
                          PickupBody(
                            userModel: state.userModel,
                            cartItems: state.userModel.cartItems,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is GetUserDataFailuer) {
              return Expanded(
                child: SizedBox.expand(
                  // Takes full available space
                  child: Center(
                    child: ErrorWidgetForCaffeineApp(),
                  ),
                ),
              );
            } else {
              return SkeltonizerOfPageViewOfCheckout();
            }
          },
        ),
      ],
    );
  }
}
