import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/payment/data/models/payment_item_model.dart';
import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';

class CustomPaymentItem extends StatelessWidget {
  const CustomPaymentItem({
    super.key,
    required this.paymentItemModel,
    required this.isChecked,
    required this.onChanged,
  });

  final PaymentItemModel paymentItemModel;
  final bool isChecked;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.mainColorTheme,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: ClipOval(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 25,
            child: Image.asset(
              paymentItemModel.image,
              width: 35,
            ),
          ),
        ),
        title: Text(
          paymentItemModel.title,
          style: TextStyles.font20Medium(context).copyWith(
            color: Colors.white,
          ),
        ),
        trailing: MSHCheckbox(
          size: 22,
          value: isChecked,
          colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
            uncheckedColor: Colors.white,
            checkedColor: AppColors.whiteColorFirst,
          ),
          style: MSHCheckboxStyle.stroke,
          onChanged: (_) => onChanged(),
        ),
      ),
    );
  }
}
