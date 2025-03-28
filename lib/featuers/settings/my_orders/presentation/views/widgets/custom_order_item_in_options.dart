import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/order_steper.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomOrderItemInOptions extends StatelessWidget {
  const CustomOrderItemInOptions({super.key, required this.orderModel});
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    Timestamp serverTimestamp = orderModel.date;
    DateTime dateTime = serverTimestamp.toDate(); // ✅ Convert to DateTime
    String formattedTime =
        DateFormat("hh:mm a", isArabic() ? "ar" : "en").format(dateTime);
    String formattedDate =
        DateFormat("d MMM yyyy", isArabic() ? "ar" : "en").format(dateTime);

    String getPaymentMethod(String paymentMethod) {
      switch (paymentMethod) {
        case 'Cash On Delivery':
          return "دفع عند الاستلام";
        case 'Payment by card':
          return "بطاقة";
        case 'Online Wallets':
          return "محفظة";
        default:
          return "غير معروف";
      }
    }

    String orderedBy(String orderedBy) {
      if (orderedBy == 'Delivery') {
        return "توصيل";
      } else {
        return "استلام من الفرع";
      }
    }

    String statusOfOrder(String statusOfOrder) {
      switch (statusOfOrder) {
        case "Pending":
          return "قيد الانتظار";
        case "Preparing":
          return "جاري التحضير";
        case "On The Way":
          return "في الطريق";
        case "Delivered":
          return "تم التوصيل";
        case "Canceled":
          return "تم الالغاء";
        default:
          return "غير معروف";
      }
    }

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
              isArabic()
                  ? statusOfOrder(orderModel.statusOfOrder)
                  : orderModel.statusOfOrder,
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
                Text('${S.of(context).order_id} : ${orderModel.orderId}',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).date} : $formattedDate',
                    style: TextStyles.font14Medium(context)),
                Text('${S.of(context).order_time} : $formattedTime',
                    style: TextStyles.font14Medium(context)),
                Text(
                    '${S.of(context).payment_method} : ${isArabic() ? getPaymentMethod(orderModel.paymentMethod) : orderModel.paymentMethod} ',
                    style: TextStyles.font14Medium(context)),
                Text(
                    '${S.of(context).order_status} : ${isArabic() ? orderedBy(orderModel.orderedBy) : orderModel.orderedBy}',
                    style: TextStyles.font14Medium(context)),
                Text(
                    '${S.of(context).price} : ${orderModel.totalPrice} ${S.of(context).le}',
                    style: TextStyles.font14Medium(context)),
                orderModel.branchModel != null
                    ? Text(
                        '${S.of(context).branch} : ${isArabic() ? orderModel.branchModel!.branchnameAr : orderModel.branchModel!.branchnameEn}',
                        style: TextStyles.font14Medium(context))
                    : SizedBox(),
              ],
            ),
          ),
          Visibility(
            visible: orderModel.orderedBy == 'Delivery',
            child: OrderStepper(
              step: orderModel.stepperValue,
            ),
          ),
          Visibility(
              visible: orderModel.orderedBy != 'Delivery',
              child: const SizedBox(height: 30)),
        ],
      ),
    );
  }
}
