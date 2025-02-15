import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/order_steper.dart';

import 'package:flutter/material.dart';

class CustomOrderItemInOptions extends StatelessWidget {
  const CustomOrderItemInOptions({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.secondaryColorTheme,
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
              'Caffeine Order',
              style: TextStyles.font18Medium(context),
            ),
            trailing: Text(
              'Under Processing',
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
                Text('Order ID : exP123456789S23-12-2023',
                    style: TextStyles.font14Medium(context)),
                Text('Date : 12-12-2023',
                    style: TextStyles.font14Medium(context)),
                Text('Order Time : 12:00 PM',
                    style: TextStyles.font14Medium(context)),
                Text('Payment Method : Cash On Delivery',
                    style: TextStyles.font14Medium(context)),
                Text('Order Status  : Pick Up',
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
