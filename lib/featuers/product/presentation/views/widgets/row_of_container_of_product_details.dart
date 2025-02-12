import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';

class RowOfContainersOfProductDetails extends StatefulWidget {
  const RowOfContainersOfProductDetails({super.key});

  @override
  State<RowOfContainersOfProductDetails> createState() =>
      _RowOfContainersOfProductDetailsState();
}

class _RowOfContainersOfProductDetailsState
    extends State<RowOfContainersOfProductDetails> {
  double _rating = 0.0;

  void _showRatingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title:
              Text("Rate this item", style: TextStyles.font22SemiBold(context)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Tap on the stars to give a rating",
                style: TextStyles.font18Medium(context),
              ),
              SizedBox(height: 10),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) =>
                    Icon(IconlyBold.star, color: Colors.amber),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyles.font18Medium(context)
                    .copyWith(color: AppColors.mainColorTheme),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: AppColors.mainColorTheme,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                CustomSnackBar().showCustomSnackBar(
                    context: context,
                    message: 'You Rated $_rating Successfully',
                    type: AnimatedSnackBarType.success);
              },
              child: Text(
                "Submit",
                style: TextStyles.font18Medium(context)
                    .copyWith(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Ice/Hot',
          style: TextStyles.font18Medium(context).copyWith(color: Colors.grey),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            _showRatingDialog(context);
          },
          child: Row(
            children: [
              Icon(
                IconlyBold.star,
                color: AppColors.mainColorTheme,
                size: 22,
              ),
              const SizedBox(width: 2),
              Text(
                '4.8',
                style: TextStyles.font18Medium(context).copyWith(),
              ),
              SizedBox(
                width: 6,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
