import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContainerOfSearchItem extends StatelessWidget {
  const ContainerOfSearchItem({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: Image.asset(Assets.imagesLatte, width: 70),
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
                  width: 70,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        isArabic()
                            ? productModel.productNameAr
                            : productModel.productNameEn,
                        style: TextStyles.font20Bold(context).copyWith(),
                      ),
                      const Spacer(),
                      Text(
                        '${productModel.productPriceS} - ${productModel.productPriceL} ${S.of(context).le}',
                        style: TextStyles.font18Bold(context).copyWith(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    isArabic()
                        ? productModel.productDescriptionAr
                        : productModel.productDescriptionEn,
                    style: TextStyles.font18Regular(context).copyWith(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
