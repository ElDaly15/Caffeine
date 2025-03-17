import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/data/model/coupon_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/row_of_price.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColumnOfPaymentSummary extends StatefulWidget {
  ColumnOfPaymentSummary(
      {super.key,
      required this.cartItems,
      required this.isDelivery,
      this.coponModel,
      required this.checkCoupon});
  final List<CartModel> cartItems;
  final bool isDelivery;
  CouponModel? coponModel;
  final bool checkCoupon;

  @override
  State<ColumnOfPaymentSummary> createState() => _ColumnOfPaymentSummaryState();
}

class _ColumnOfPaymentSummaryState extends State<ColumnOfPaymentSummary> {
  @override
  Widget build(BuildContext context) {
    var totalPrice = widget.cartItems.fold<dynamic>(
      0.0,
      (sum, item) =>
          sum +
          (item.sizeEn == 'L'
              ? int.parse(item.productPriceL) * item.quantity
              : item.sizeEn == 'M'
                  ? int.parse(item.productPriceM) * item.quantity
                  : int.parse(item.productPriceS) * item.quantity),
    );
    var discountTotalPrice = totalPrice;
    if (widget.coponModel != null) {
      discountTotalPrice =
          totalPrice - (totalPrice * (widget.coponModel?.copounValue ?? 0));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).payment_summary,
          style: TextStyles.font20SemiBold(context),
        ),
        const SizedBox(
          height: 10,
        ),
        RowOfPrice(
            title: S.of(context).price,
            price: '$totalPrice ${S.of(context).le}'),
        const SizedBox(
          height: 10,
        ),
        Visibility(
          visible: widget.isDelivery,
          child: Column(
            children: [
              RowOfPrice(
                title: S.of(context).delivery_fee,
                price: '25 ${S.of(context).le}',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        Visibility(
          visible: widget.coponModel != null,
          child: Column(
            children: [
              RowOfPrice(
                title: S.of(context).copoun_value,
                price: widget.coponModel != null
                    ? '${(widget.coponModel!.copounValue * 100).toInt()} %'
                    : '0 %',
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        RowOfPrice(
          title: S.of(context).Total,
          price: widget.isDelivery
              ? '${discountTotalPrice + 25} ${S.of(context).le}'
              : '$discountTotalPrice ${S.of(context).le}',
        ),
      ],
    );
  }
}
