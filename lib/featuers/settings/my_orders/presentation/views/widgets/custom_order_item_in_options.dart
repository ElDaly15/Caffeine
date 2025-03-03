import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/order_steper.dart';
import 'package:caffeine/generated/l10n.dart';

import 'package:flutter/material.dart';

class CustomOrderItemInOptions extends StatelessWidget {
  const CustomOrderItemInOptions({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.secondaryColorTheme.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: const Icon(
              Icons.local_shipping_outlined,
              color: AppColors.mainColorTheme,
            ),
            title: Text(
              S.of(context).caffeine_order,
              style: TextStyles.font18Medium(context),
            ),
            trailing: Text(
              S.of(context).under_processing,
              style: TextStyles.font14SemiBold(context).copyWith(
                color: AppColors.mainColorTheme,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${S.of(context).order_id} : exP123456789S23-12-2023',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).date} : 12-12-2023',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).order_time} : 12:00 PM',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).payment_method} : Cash On Delivery',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).order_status} : Pick Up',
                    style: TextStyles.font14Medium(context)),
              ],
            ),
          ),
          OrderStepper(
            step: int.parse('0'),
          ),
        ],
      ),
    );
  }
}
