import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContainerOfTotalPriceAndProcessCheckOut extends StatelessWidget {
  const ContainerOfTotalPriceAndProcessCheckOut(
      {super.key,
      required this.onPressed,
      required this.price,
      required this.items});
  final void Function() onPressed;
  final String price;
  final int items;

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
                '${S.of(context).Total} ($items ${S.of(context).items}) : ',
                style: TextStyles.font18SemiBold(context).copyWith(
                  color: Colors.grey,
                ),
              ),
              Spacer(),
              Text(
                '$price ${S.of(context).le}',
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
                    S.of(context).proceed_to_checkout,
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
