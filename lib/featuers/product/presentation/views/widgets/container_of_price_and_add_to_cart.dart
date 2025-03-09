import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContainerOfPriceAndAddToCart extends StatelessWidget {
  const ContainerOfPriceAndAddToCart(
      {super.key, required this.addToCart, required this.price});
  final void Function() addToCart;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 1), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).price,
                  style: TextStyles.font22Medium(context)
                      .copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '$price ${S.of(context).le}',
                  style: TextStyles.font22SemiBold(context)
                      .copyWith(color: AppColors.mainColorTheme),
                ),
              ],
            ),
            SizedBox(
              width: 60,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.mainColorTheme,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
                onPressed: addToCart,
                child: Text(
                  S.of(context).buy_now,
                  style: TextStyles.font22SemiBold(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
