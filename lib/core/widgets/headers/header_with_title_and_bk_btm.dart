import 'package:flutter/material.dart';
import '../../utils/app_styles.dart';

class CustomHeaderWithTitleAndBackBtm extends StatelessWidget {
  const CustomHeaderWithTitleAndBackBtm(
      {super.key, required this.title, required this.color});
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: color,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyles.font20SemiBold(context).copyWith(color: color),
        ),
        const Spacer(),
      ],
    );
  }
}
