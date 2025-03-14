import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/core/widgets/loading_widgets/cart_view_loading.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_cart/manage_cart_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/views/checkout_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_total_price_and_checkout.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/sliver_list_of_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return BlocConsumer<ManageCartCubit, ManageCartState>(
            listener: (context, manageCartStates) {
              if (manageCartStates is ManageCartForIncreaseAndDecreaseFailuer) {
                CustomSnackBar().showCustomSnackBar(
                    context: context,
                    message: 'An error occurred , Try again',
                    type: AnimatedSnackBarType.error);
              }
              if (manageCartStates is ManageCartForSizeFailuer) {
                CustomSnackBar().showCustomSnackBar(
                    context: context,
                    message: 'An error occurred , Try again',
                    type: AnimatedSnackBarType.error);
              }
            },
            builder: (context, manageCartStates) {
              return ModalProgressHUD(
                inAsyncCall: state is ManageCartForIncreaseAndDecreaseLoading ||
                    manageCartStates is ManageCartForSizeLoading,
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.5),
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.mainColorTheme,
                ),
                child: Column(
                  children: [
                    Container(
                      height: 10,
                      color: AppColors.mainColorTheme,
                    ),
                    const CustomHeaderOfCaffeieApp(),
                    Expanded(
                      // This fixes the issue
                      child: CustomScrollView(
                        physics: const ClampingScrollPhysics(),
                        slivers: [
                          SliverToBoxAdapter(
                              child: SizedBox(
                            height: 10,
                          )),
                          SliverListOfCartItems(
                            cartItems: state.userModel.cartItems,
                          ),
                        ],
                      ),
                    ),
                    ContainerOfTotalPriceAndProcessCheckOut(
                      onPressed: () {
                        g.Get.to(() => const CheckoutView(),
                            transition: g.Transition.fade,
                            duration: const Duration(milliseconds: 400));
                      },
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is GetUserDataFailuer) {
          return ErrorWidgetForCaffeineApp();
        } else {
          return CartViewLoading();
        }
      },
    );
  }
}
