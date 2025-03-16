import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem(
      {super.key, required this.delete, required this.cartModel});
  final void Function() delete;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
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
              imageUrl: cartModel.productImage,
              width: 70,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      isArabic()
                          ? cartModel.productNameAr
                          : cartModel.productNameEn,
                      style: TextStyles.font18SemiBold(context),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: delete,
                      child: Icon(IconlyLight.delete),
                    ),
                  ],
                ),
                Text(
                  '${S.of(context).size} : ${isArabic() ? cartModel.sizeAr : cartModel.sizeEn} | ${S.of(context).quantity}: ${cartModel.quantity}',
                  style: TextStyles.font14Regular(context),
                ),
                Text(
                  ' ${cartModel.sizeEn == 'S' ? cartModel.productPriceS : cartModel.sizeEn == 'M' ? cartModel.productPriceM : cartModel.productPriceL} ${S.of(context).le}',
                  style: TextStyles.font18Bold(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
