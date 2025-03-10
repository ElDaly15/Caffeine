import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/home/data/models/ads_model.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomPageViewOfAds extends StatelessWidget {
  const CustomPageViewOfAds({super.key, required this.ads});
  final List<AdsModel> ads;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 210,
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ads.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  placeholder: (context, url) => Skeletonizer(
                    effect: ShimmerEffect(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      duration: const Duration(seconds: 1),
                    ),
                    enabled: true,
                    child: Image.asset(
                      Assets.imagesLatte,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.26,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    size: 40,
                    color: AppColors.mainColorTheme,
                  ),
                  imageUrl: ads[index].url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.26,
                ),
              ),
            );
          }),
    );
  }
}
