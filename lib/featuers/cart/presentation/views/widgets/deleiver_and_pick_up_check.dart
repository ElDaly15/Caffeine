import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DeleiverAndPickUpCheck extends StatefulWidget {
  const DeleiverAndPickUpCheck({super.key, required this.onChanged});
  final void Function(int indexOfPage) onChanged;

  @override
  State<DeleiverAndPickUpCheck> createState() => _DeleiverAndPickUpCheckState();
}

class _DeleiverAndPickUpCheckState extends State<DeleiverAndPickUpCheck> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Color(0xffEDEDED),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 0;
                  widget.onChanged(index);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: index == 0
                      ? AppColors.mainColorTheme
                      // ignore: deprecated_member_use
                      : Color(0xffEDEDED),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Deliver',
                    style: TextStyles.font18SemiBold(context).copyWith(
                        color: index == 0 ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  index = 1;
                  widget.onChanged(index);
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: index == 1
                      ? AppColors.mainColorTheme
                      // ignore: deprecated_member_use
                      : Color(0xffEDEDED),
                ),
                child: Center(
                  child: Text(
                    'Pickup',
                    style: TextStyles.font18SemiBold(context).copyWith(
                        color: index == 1 ? Colors.white : Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
