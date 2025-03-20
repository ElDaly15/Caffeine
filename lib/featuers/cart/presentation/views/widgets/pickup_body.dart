// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/core/widgets/text_fields/search_pick_up_cafe_text_field.dart';
import 'package:caffeine/core/widgets/text_fields/text_field_of_copon.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/data/model/coupon_model.dart';
import 'package:caffeine/featuers/cart/presentation/manager/check_copoun/check_copoun_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/get_branches/get_branches_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/search_branch/search_branch_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/views/add_note_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/edit_note_view.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/column_of_payment_summary.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_coupon_applies.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_process_to_payment.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_with_icon_and_text.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/sliver_list_of_container_pick_up.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/your_order_list_view.dart';
import 'package:caffeine/featuers/payment/presentation/views/payment_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class PickupBody extends StatefulWidget {
  const PickupBody(
      {super.key, required this.cartItems, required this.userModel});
  final List<CartModel> cartItems;
  final UserModel userModel;
  @override
  State<PickupBody> createState() => _PickupBodyState();
}

class _PickupBodyState extends State<PickupBody> {
  bool coponApplied = false;
  bool checkPickUp = false;
  String copounValue = '';
  CouponModel? couponModel;
  String? searchValue;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetBranchesCubit>(context).getBranches();
  }

  @override
  Widget build(BuildContext context) {
    var totalPrice = widget.cartItems.fold<dynamic>(
      0.0,
      (sum, item) =>
          sum +
          (item.sizeEn == 'L'
              ? (double.parse(item.productPriceL) * item.quantity).toInt()
              : item.sizeEn == 'M'
                  ? (double.parse(item.productPriceM) * item.quantity).toInt()
                  : (double.parse(item.productPriceS) * item.quantity).toInt()),
    );
    num discountTotalPrice = totalPrice;
    if (couponModel != null) {
      discountTotalPrice =
          totalPrice - (totalPrice * (couponModel?.copounValue ?? 0));
    }
    return Column(
      children: [
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).pickup_from_cafe,
                    style: TextStyles.font20SemiBold(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      children: [
                        CustomContainerWithIconAndText(
                          title: widget.userModel.note == ''
                              ? S.of(context).add_note
                              : S.of(context).edit_note,
                          iconData: IconlyLight.paper,
                          onTap: () {
                            widget.userModel.note == ''
                                ? g.Get.to(() => const AddNoteView(),
                                    transition: g.Transition.fade,
                                    duration: const Duration(milliseconds: 350))
                                : g.Get.to(
                                    () => EditNoteView(
                                          note: widget.userModel.note,
                                        ),
                                    transition: g.Transition.fade,
                                    duration:
                                        const Duration(milliseconds: 350));
                          },
                        ),
                      ],
                    ),
                  )),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Divider(
                  thickness: 1.5,
                  color: Color(0xffECECEC),
                  endIndent: 40,
                  indent: 40,
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              YourOrdersListView(
                cartItems: widget.cartItems,
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 5,
                  color: Color(0xffF9F2ED),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              BlocConsumer<CheckCopounCubit, CheckCopounState>(
                listener: (context, state) {
                  if (state is CheckCopounFailuer) {
                    CustomSnackBar().showCustomSnackBar(
                        context: context,
                        message: state.msg,
                        type: AnimatedSnackBarType.error);
                  } else if (state is CheckCopounSuccess) {
                    setState(() {
                      couponModel =
                          state.couponModel; // Update the coupon model
                      coponApplied = true; // Mark coupon as applied
                    });
                  }
                },
                builder: (context, state) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    sliver: SliverToBoxAdapter(
                      child: coponApplied
                          ? ContainerOfCouponSuccessApplied(
                              onTap: () {
                                BlocProvider.of<CheckCopounCubit>(context)
                                    .emit(CheckCopounInitial());
                                setState(() {
                                  copounValue = '';
                                  coponApplied = false;
                                  couponModel = null; // Remove applied coupon
                                });
                              },
                            )
                          : CustomTextFieldOfCopons(
                              isLoading: state is CheckCopounLoading,
                              onSubmitted: (value) {
                                copounValue = value;
                              },
                              onPressed: () {
                                if (copounValue.isNotEmpty) {
                                  BlocProvider.of<CheckCopounCubit>(context)
                                      .checkCopoun(
                                          code: copounValue, context: context);
                                } else {
                                  CustomSnackBar().showCustomSnackBar(
                                      context: context,
                                      message: S.of(context).enter_copoun_code,
                                      type: AnimatedSnackBarType.error);
                                }
                              },
                            ),
                    ),
                  );
                },
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: ColumnOfPaymentSummary(
                    checkCoupon: coponApplied,
                    coponModel: couponModel,
                    isDelivery: false,
                    cartItems: widget.cartItems,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 5,
                  color: Color(0xffF9F2ED),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: Text(
                    S.of(context).select_pickup_cafe,
                    style: TextStyles.font20SemiBold(context),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                sliver: SliverToBoxAdapter(
                  child: SearchForPickUpCafeTextField(
                    onSubmitted: (value) {
                      setState(() {
                        searchValue = value;
                      });

                      if (searchValue == null || searchValue!.isEmpty) {
                        BlocProvider.of<SearchBranchCubit>(context)
                            .emit(SearchBranchInitial());
                        BlocProvider.of<GetBranchesCubit>(context)
                            .getBranches();
                      } else {
                        BlocProvider.of<SearchBranchCubit>(context)
                            .searchBranches(searchValue: value);
                      }
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 20,
                ),
              ),
              BlocBuilder<GetBranchesCubit, GetBranchesState>(
                builder: (context, state) {
                  if (state is GetBranchesSuccess) {
                    if (searchValue == null || searchValue!.isEmpty) {
                      BlocProvider.of<SearchBranchCubit>(context)
                          .emit(SearchBranchInitial());
                    }
                    List<BranchModel> originalBranches = state.branches;

                    return BlocBuilder<SearchBranchCubit, SearchBranchState>(
                      builder: (context, searchState) {
                        List<BranchModel> displayedBranches = originalBranches;

                        if (searchState is SearchBranchSuccess) {
                          displayedBranches = searchState.branchesList;
                        } else if (searchState is SearchBranchFailuer ||
                            searchValue == null ||
                            searchValue!.trim().isEmpty) {
                          displayedBranches = originalBranches; // Reset list
                        }

                        return displayedBranches.isEmpty
                            ? SliverFillRemaining(
                                hasScrollBody: false,
                                child: Center(
                                  child: Text(
                                    S.of(context).no_branches_found,
                                    style: TextStyles.font20SemiBold(context)
                                        .copyWith(
                                            color: AppColors.mainColorTheme),
                                  ),
                                ),
                              )
                            : SliverOfContainerOfPickUpCafe(
                                onBranchSelected: (value) {},
                                branches: searchState is SearchBranchInitial
                                    ? state.branches
                                    : displayedBranches,
                                onChanged: (value) {
                                  setState(() {
                                    checkPickUp = value;
                                  });
                                },
                              );
                      },
                    );
                  } else if (state is GetBranchesFailuer) {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: ErrorWidgetForCaffeineApp(),
                    );
                  } else {
                    return SliverFillRemaining(
                      hasScrollBody: false,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.mainColorTheme,
                        ),
                      ),
                    );
                  }
                },
              ),
              SliverToBoxAdapter(
                child: const SizedBox(
                  height: 10,
                ),
              ),
            ],
          ),
        ),
        ContainerOfProcessToPayment(
          onPressed: checkPickUp && widget.cartItems.isNotEmpty
              ? () {
                  g.Get.to(
                      () => PaymentView(
                            totalPrice: discountTotalPrice.toInt(),
                          ),
                      transition: g.Transition.fade,
                      duration: const Duration(milliseconds: 350));
                }
              : null,
        ),
      ],
    );
  }
}
