// ignore_for_file: deprecated_member_use

import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/loading_widgets/product_loading_view.dart';
import 'package:caffeine/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/container_of_price_and_add_to_cart.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/custom_product_header.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/read_more_and_less_widget.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_of_product_details.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/row_of_container_size.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductViewBody extends StatefulWidget {
  const ProductViewBody({super.key});

  @override
  State<ProductViewBody> createState() => _ProductViewBodyState();
}

class _ProductViewBodyState extends State<ProductViewBody> {
  String size = 'S';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductByCodeCubit, GetProductByCodeState>(
      builder: (context, state) {
        if (state is GetProductsByCodeSuccess) {
          return BlocConsumer<ManageFavouriteProductsCubit,
              ManageFavouriteProductsState>(
            listener: (context, favState) {},
            builder: (context, favState) {
              return ModalProgressHUD(
                inAsyncCall: favState is ManageFavouriteProductsLoading,
                color: Colors.white.withOpacity(0.5),
                progressIndicator: const CircularProgressIndicator(
                  color: AppColors.mainColorTheme,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SafeArea(
                                  child: SizedBox(
                                height: 0,
                              )),
                              CustommProductAppBarWithWhishlistTheItems(
                                productModel: state.productModel,
                                onPressed: () {},
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Skeletonizer(
                                    effect: ShimmerEffect(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      duration: const Duration(seconds: 1),
                                    ),
                                    enabled: true,
                                    child: Image.asset(
                                      Assets.imagesLatte,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Skeletonizer(
                                    effect: ShimmerEffect(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[100]!,
                                      duration: const Duration(seconds: 1),
                                    ),
                                    enabled: false,
                                    child: Image.asset(
                                      Assets.imagesPlaceholderImage,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    ),
                                  ),
                                  imageUrl: state.productModel.productImage,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.26,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isArabic()
                                        ? state.productModel.productNameAr
                                        : state.productModel.productNameEn,
                                    style: TextStyles.font24SemiBold(context)
                                        .copyWith(fontSize: 28),
                                  ),
                                  RowOfContainersOfProductDetails(
                                    productModel: state.productModel,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).description,
                                style: TextStyles.font24SemiBold(context)
                                    .copyWith(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ReadMoreAndLessWidget(
                                productModel: state.productModel,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                S.of(context).size,
                                style: TextStyles.font24SemiBold(context)
                                    .copyWith(),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              RowOfContainerSizes(
                                onChangeSize: (value) {
                                  setState(() {
                                    size = value;
                                  });
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ContainerOfPriceAndAddToCart(
                      price: size == 'L'
                          ? state.productModel.productPriceL
                          : size == 'M'
                              ? state.productModel.productPriceM
                              : state.productModel.productPriceS,
                      addToCart: () {},
                    ),
                  ],
                ),
              );
            },
          );
        } else if (state is GetProductsByCodeFailuer) {
          return ErrorWidgetForCaffeineApp();
        } else {
          return ProductLoadingView();
        }
      },
    );
  }
}
