import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PageLoadingOfAds extends StatelessWidget {
  const PageLoadingOfAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    Assets.imagesBanner,
                    alignment: Alignment.center,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
