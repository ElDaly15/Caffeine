import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircleAvatar(
              backgroundColor: AppColors.mainColorTheme,
              child: Icon(
                IconlyBold.notification,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('New Product',
                        style: TextStyles.font18Medium(context)),
                    Spacer(), // This pushes the second text to the right
                    Text('6 December, 2024',
                        style: TextStyles.font14SemiBold(context)),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                    'New Product Caffe Late With Milk Cold/Hot With Discount 30% Off Now .',
                    style: TextStyles.font20SemiBold(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
