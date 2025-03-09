import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/utils/global_fun.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/featuers/product/presentation/manager/manage_rating/magnage_rating_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconly/iconly.dart';

class RowOfContainersOfProductDetails extends StatefulWidget {
  const RowOfContainersOfProductDetails(
      {super.key, required this.productModel});
  final ProductModel productModel;

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
        return BlocBuilder<MagnageRatingCubit, MagnageRatingState>(
          builder: (context, state) {
            bool isLoading = state is MagnageRatingLoading;

            return AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                S.of(context).rate_this_item,
                style: TextStyles.font22SemiBold(context),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).tap_on_stars,
                    style: TextStyles.font18Medium(context),
                  ),
                  const SizedBox(height: 10),
                  RatingBar.builder(
                    initialRating: _rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      IconlyBold.star,
                      color: Colors.amber,
                    ),
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
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: Text(
                    S.of(context).cancel,
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
                  onPressed: isLoading
                      ? null
                      : () {
                          BlocProvider.of<MagnageRatingCubit>(context)
                              .manageRating(
                            code: widget.productModel.productCode,
                            rate: _rating,
                          );
                        },
                  child: isLoading
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          S.of(context).submit,
                          style: TextStyles.font18Medium(context)
                              .copyWith(color: Colors.white),
                        ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MagnageRatingCubit, MagnageRatingState>(
      listener: (context, state) {
        if (state is MagnageRatingSuccess) {
          if (mounted) {
            Navigator.pop(context);
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message:
                  '${S.of(context).YouRated} $_rating ${S.of(context).Successfully}',
              type: AnimatedSnackBarType.success,
            );
          }
        }
        if (state is MagnageRatingFailuer) {
          Navigator.pop(context);
          if (mounted) {
            CustomSnackBar().showCustomSnackBar(
              context: context,
              message: 'An error occurred while rating, please try again',
              type: AnimatedSnackBarType.error,
            );
          }
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            Text(
              checkDescription(widget.productModel.productInfo),
              style:
                  TextStyles.font18Medium(context).copyWith(color: Colors.grey),
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
                    (widget.productModel.rating /
                            widget.productModel.ratingCount)
                        .toString(),
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
      },
    );
  }
}
