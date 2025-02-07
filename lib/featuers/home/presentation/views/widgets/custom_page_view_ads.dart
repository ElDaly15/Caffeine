import 'package:caffeine/core/utils/app_images.dart';
import 'package:flutter/material.dart';

class CustomPageViewOfAds extends StatelessWidget {
  const CustomPageViewOfAds({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
