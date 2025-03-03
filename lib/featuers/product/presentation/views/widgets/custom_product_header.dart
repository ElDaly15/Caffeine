import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustommProductAppBarWithWhishlistTheItems extends StatelessWidget {
  const CustommProductAppBarWithWhishlistTheItems(
      {super.key, required this.onPressed});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          S.of(context).detail,
          style: TextStyles.font20SemiBold(context).copyWith(),
        ),
        const Spacer(),
        IconButton(
          icon: const Icon(
            IconlyLight.heart,
            color: Colors.black,
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
