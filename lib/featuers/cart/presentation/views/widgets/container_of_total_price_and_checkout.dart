import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfTotalPriceAndProcessCheckOut extends StatelessWidget {
  const ContainerOfTotalPriceAndProcessCheckOut(
      {super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      height: 115,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Total (3 item) : ',
                style: TextStyles.font18SemiBold(context).copyWith(
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text(
                r'$198.00',
                style: TextStyles.font20Bold(context),
              ),
            ],
          ),
          Spacer(),
          SizedBox(
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColorTheme,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
              onPressed: onPressed,
              child: Row(
                children: [
                  Text(
                    'Proceed to Checkout',
                    style: TextStyles.font18SemiBold(context).copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.mainColorTheme,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
