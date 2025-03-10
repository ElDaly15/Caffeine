import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/row_of_price.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ColumnOfPaymentSummary extends StatelessWidget {
  const ColumnOfPaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
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
          price: r'$198.00',
        ),
        const SizedBox(
          height: 10,
        ),
        RowOfPrice(
          title: S.of(context).delivery_fee,
          price: r'$2.00',
        ),
        const SizedBox(
          height: 10,
        ),
        RowOfPrice(
          title: S.of(context).Total,
          price: r'$200.00',
        ),
      ],
    );
  }
}
