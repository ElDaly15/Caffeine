import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/inc_and_dec_counter_of_cart.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_size_in_cart_item.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';

class ContainerOfCartItem extends StatefulWidget {
  const ContainerOfCartItem(
      {super.key,
      required this.onSwiped,
      required this.counterOfProduct,
      required this.cartModel});
  final void Function(SwipeDirection) onSwiped;
  final void Function(int) counterOfProduct;
  final CartModel cartModel;
  @override
  State<ContainerOfCartItem> createState() => _ContainerOfCartItemState();
}

class _ContainerOfCartItemState extends State<ContainerOfCartItem> {
  int index = 0;
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  Assets.imagesLatte,
                  scale: 2.5,
                  fit: BoxFit.cover,
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
                          ? widget.cartModel.productNameAr
                          : widget.cartModel.productNameEn,
                      style: TextStyles.font20SemiBold(context),
                    ),
                    Text(
                      '${S.of(context).size} : ${widget.cartModel.sizeEn}',
                      style: TextStyles.font18Medium(context)
                          .copyWith(color: Colors.grey),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Text(
                          '${widget.cartModel.sizeEn == 'S' ? widget.cartModel.productPriceS : widget.cartModel.sizeEn == 'M' ? widget.cartModel.productPriceM : widget.cartModel.productPriceL} ${S.of(context).le}',
                          style: TextStyles.font20Bold(context),
                        ),
                        Spacer(),
                        IncreaseAndDecreaseContainer(
                          counter: widget.cartModel.quantity,
                          counterOfProduct: widget.counterOfProduct,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        ContainerOfSizeInCartItem(
                          onTap: () {
                            setState(() {
                              index = 0;
                            });
                          },
                          title: S.of(context).small,
                          isActive: widget.cartModel.sizeEn == 'S',
                        ),
                        SizedBox(width: 5),
                        ContainerOfSizeInCartItem(
                          onTap: () {
                            setState(() {
                              index = 1;
                            });
                          },
                          title: S.of(context).medium,
                          isActive: widget.cartModel.sizeEn == 'M',
                        ),
                        SizedBox(width: 5),
                        ContainerOfSizeInCartItem(
                          onTap: () {
                            setState(() {
                              index = 2;
                            });
                          },
                          title: S.of(context).large,
                          isActive: widget.cartModel.sizeEn == 'L',
                        ),
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
