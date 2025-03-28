import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/utils/global_fun.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/presentation/manager/add_item_to_cart/add_item_to_cart_cubit.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine/featuers/product/presentation/views/product_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart' as g;
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:uuid/uuid.dart';

class ContainerOfProduct extends StatelessWidget {
  const ContainerOfProduct({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    return GestureDetector(
      onTap: () {
        BlocProvider.of<GetProductByCodeCubit>(context)
            .getProductByCode(code: productModel.productCode);
        g.Get.to(() => const ProductView(),
            transition: g.Transition.fade,
            duration: const Duration(milliseconds: 400));
      },
      child: SizedBox(
        width: w <= 400
            ? MediaQuery.of(context).size.width * 0.44
            : MediaQuery.of(context).size.width * 0.45,
        child: AspectRatio(
          aspectRatio: w <= 400 ? 2 / 3.29 : 2.3 / 3.9,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: IntrinsicHeight(
              // Wrap the Column in IntrinsicHeight
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
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
                            errorWidget: (context, url, error) => Skeletonizer(
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
                            imageUrl: productModel.productImage,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          Positioned(
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 8, top: 4, bottom: 8),
                                child: SizedBox(
                                  width: 60,
                                  child: Row(
                                    mainAxisAlignment: isArabic()
                                        ? MainAxisAlignment.start
                                        : MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        IconlyBold.star,
                                        color: AppColors.mainColorTheme,
                                        size: 22,
                                      ),
                                      const SizedBox(width: 2),
                                      Text(
                                        NumberFormat("#.#").format(
                                            productModel.rating /
                                                productModel.ratingCount),
                                        style: TextStyles.font18Medium(context)
                                            .copyWith(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      isArabic()
                          ? productModel.productNameAr
                          : productModel.productNameEn,
                      style: TextStyles.font22SemiBold(context).copyWith(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      checkDescription(productModel.productInfo),
                      style: TextStyles.font18Medium(context)
                          // ignore: deprecated_member_use
                          .copyWith(color: Colors.grey.withOpacity(0.8)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          '${productModel.productPriceS} ${S.of(context).le}',
                          style: TextStyles.font22SemiBold(context).copyWith(),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        style: IconButton.styleFrom(
                          backgroundColor: AppColors.mainColorTheme,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          var uuid = Uuid();
                          CartModel cartModel = CartModel(
                              productNameAr: productModel.productNameAr,
                              productNameEn: productModel.productNameEn,
                              productImage: productModel.productImage,
                              productCode: productModel.productCode,
                              sizeEn: 'S',
                              sizeAr: 'صغير',
                              orderProductCode: uuid.v4(),
                              productCategory: productModel.productCategory,
                              productPriceS: productModel.productPriceS,
                              productPriceM: productModel.productPriceM,
                              productPriceL: productModel.productPriceL,
                              quantity: 1);
                          BlocProvider.of<AddItemToCartCubit>(context)
                              .addItemToCart(cartModel: cartModel);
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
