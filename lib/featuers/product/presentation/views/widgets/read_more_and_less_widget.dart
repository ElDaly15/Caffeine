import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:parsed_readmore/parsed_readmore.dart';

class ReadMoreAndLessWidget extends StatelessWidget {
  const ReadMoreAndLessWidget({super.key, required this.productModel});
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return ParsedReadMore(
      TextHighlightParser(
        data: isArabic()
            ? productModel.productDescriptionAr
            : productModel.productDescriptionEn,
      ),
      readMoreText: S.of(context).read_more,
      readLessText: S.of(context).read_less,
      readMoreTextStyle: TextStyles.font18Bold(context)
          .copyWith(color: AppColors.mainColorTheme),
      readLessTextStyle: TextStyles.font18Bold(context)
          .copyWith(color: AppColors.mainColorTheme),
      style: TextStyles.font18Regular(context).copyWith(color: Colors.grey),
    );
  }
}
