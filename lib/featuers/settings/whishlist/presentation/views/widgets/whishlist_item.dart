import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class WhishlistItem extends StatefulWidget {
  const WhishlistItem(
      {super.key, required this.onSwiped, required this.productModel});
  final void Function(SwipeDirection) onSwiped;
  final ProductModel productModel;
  @override
  State<WhishlistItem> createState() => _WhishlistItemState();
}

class _WhishlistItemState extends State<WhishlistItem> {
  @override
  Widget build(BuildContext context) {
    return SwipeableTile.card(
      color: Colors.white,
      borderRadius: 12,
      shadow: BoxShadow(
        // ignore: deprecated_member_use
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: 3,
        blurRadius: 2,
        offset: const Offset(0, 1), // changes position of shadow
      ),
      horizontalPadding: 0,
      verticalPadding: 8,
      direction: SwipeDirection.endToStart,
      onSwiped: widget.onSwiped,
      backgroundBuilder: (context, direction, progress) {
        return AnimatedBuilder(
          animation: progress,
          builder: (context, child) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              color: progress.value > 0.4
                  ? AppColors.mainColorTheme
                  : const Color(0xFFed7474),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.delete,
                    color: AppColors.secondaryColorTheme,
                  ),
                ),
              ),
            );
          },
        );
      },
      key: UniqueKey(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: IntrinsicHeight(
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
                  imageUrl: widget.productModel.productImage,
                  fit: BoxFit.cover,
                  scale: 3.5,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isArabic()
                          ? widget.productModel.productNameAr
                          : widget.productModel.productNameEn,
                      style: TextStyles.font20SemiBold(context),
                    ),
                    Text(
                      isArabic()
                          ? widget.productModel.productDescriptionAr
                          : widget.productModel.productDescriptionEn,
                      style: TextStyles.font18Regular(context).copyWith(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${widget.productModel.productPriceS} - ${widget.productModel.productPriceL} ${S.of(context).le}',
                          style: TextStyles.font20Bold(context),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
