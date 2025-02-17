import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomOrderItem extends StatelessWidget {
  const CustomOrderItem({super.key, required this.delete});
  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Assets.imagesLatte,
              scale: 3.2,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Latte',
                      style: TextStyles.font18SemiBold(context),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: delete,
                      child: Icon(IconlyLight.delete),
                    ),
                  ],
                ),
                Text(
                  'Size : Regular | Qunaitity: 1',
                  style: TextStyles.font14Regular(context),
                ),
                Text(
                  r'$5.2',
                  style: TextStyles.font18Bold(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
