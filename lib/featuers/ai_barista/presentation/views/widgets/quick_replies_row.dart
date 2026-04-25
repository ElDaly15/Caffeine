import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class QuickRepliesRow extends StatelessWidget {
  const QuickRepliesRow({
    super.key,
    required this.suggestions,
    required this.onTap,
  });

  final List<String> suggestions;
  final void Function(String value) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        itemCount: suggestions.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final s = suggestions[i];
          return Material(
            color: AppColors.whiteColorSecond,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: AppColors.mainColorTheme, width: 1),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => onTap(s),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                child: Center(
                  child: Text(
                    s,
                    style: TextStyles.font12Medium(context)
                        .copyWith(color: AppColors.mainColorTheme),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
