import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class TextBtm extends StatelessWidget {
  const TextBtm({super.key, required this.title, required this.onPressed});
  final String title;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyles.font14SemiBold(context)
            .copyWith(color: Theme.of(context).cardColor),
      ),
    );
  }
}
