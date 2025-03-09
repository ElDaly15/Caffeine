import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ContainerOfSizeInCartItem extends StatefulWidget {
  const ContainerOfSizeInCartItem({
    super.key,
    required this.isActive,
    required this.title,
    required this.onTap,
  });

  final bool isActive;
  final String title;
  final void Function() onTap;

  @override
  State<ContainerOfSizeInCartItem> createState() =>
      _ContainerOfSizeInCartItemState();
}

class _ContainerOfSizeInCartItemState extends State<ContainerOfSizeInCartItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: widget.onTap,
        child: TweenAnimationBuilder<Color?>(
          duration: const Duration(milliseconds: 300),
          tween: ColorTween(
            begin: Colors.white,
            end: widget.isActive ? AppColors.mainColorTheme : Colors.white,
          ),
          builder: (context, color, child) {
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.mainColorTheme),
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyles.font20SemiBold(context).copyWith(
                      color: widget.isActive ? Colors.white : Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
