import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  State<DeleteAccount> createState() => _NotificationOnAndOffState();
}

class _NotificationOnAndOffState extends State<DeleteAccount> {
  bool valueOfSwitchNotification = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: AppColors.secondaryColorTheme,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.no_accounts_outlined,
            color: AppColors.mainColorTheme,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          'Delete Account',
          style: TextStyles.font18SemiBold(context)
              .copyWith(color: AppColors.darkTheme),
        ),
        const Spacer(),
        TextButton(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.mainColorTheme,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: widget.onPressed,
            child: Text(
              'Delete Account',
              style: TextStyles.font14SemiBold(context)
                  .copyWith(color: Colors.white),
            ))
      ],
    );
  }
}
