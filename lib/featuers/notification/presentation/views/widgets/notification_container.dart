import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/notification/data/model/notification_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key, required this.notificationModel});
  final NotificationModel notificationModel;
  @override
  Widget build(BuildContext context) {
    Timestamp serverTimestamp = notificationModel.date;
    DateTime dateTime = serverTimestamp.toDate(); // ✅ Convert to DateTime
    String formattedTime =
        DateFormat("hh:mm a", isArabic() ? "ar" : "en").format(dateTime);
    String formattedDate =
        DateFormat("d MMM, yyyy", isArabic() ? "ar" : "en").format(dateTime);

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
                    Text(
                        isArabic()
                            ? notificationModel.titleAr
                            : notificationModel.titleEn,
                        style: TextStyles.font18Medium(context)),
                    Spacer(), // This pushes the second text to the right
                    Text('$formattedDate | $formattedTime',
                        style: TextStyles.font14SemiBold(context)),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                    isArabic()
                        ? notificationModel.bodyAr
                        : notificationModel.bodyEn,
                    style: TextStyles.font20SemiBold(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
