import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/text_fields/custom_search_text_field.dart';
import 'package:caffeine/featuers/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;
import 'package:skeletonizer/skeletonizer.dart';

class SearchAndStartLoading extends StatelessWidget {
  const SearchAndStartLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: Container(
        width: double.infinity,
        color: AppColors.darkTheme,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: SizedBox(
                  height: 10,
                ),
              ),
              Text(
                'Hello 👋 ,',
                style: TextStyles.font20Regular(context)
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Mazen El Daly ',
                style: TextStyles.font24Regular(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  g.Get.to(() => const SearchView(),
                      transition: g.Transition.fade,
                      duration: const Duration(milliseconds: 300));
                },
                child: CustomSearchTextField(
                  onChanged: (value) {},
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
