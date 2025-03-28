import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomErrorWithHeaderAndBackBtm extends StatelessWidget {
  const CustomErrorWithHeaderAndBackBtm({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: SafeArea(child: SizedBox()),
        ),
        SliverToBoxAdapter(
          child: CustomHeaderWithTitleAndBackBtm(
            title: S.of(context).my_orders,
            color: Colors.black,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 15),
        ),
        SliverFillRemaining(
          hasScrollBody: false, // Ensures it takes up remaining space
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: AppColors.mainColorTheme,
                size: 120,
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: TextStyles.font20SemiBold(context)
                    .copyWith(color: AppColors.mainColorTheme),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
