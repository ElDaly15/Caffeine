// ignore_for_file: file_names

import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/container_of_list_tile_main_settings.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_privacy_and_politecs_container.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SettingsLoading extends StatelessWidget {
  const SettingsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            height: 10,
            color: AppColors.mainColorTheme,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomHeaderOfCaffeieApp(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  duration: const Duration(seconds: 1),
                ),
                child: ContainerOfListTileSettings()),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverToBoxAdapter(
            child: Skeletonizer(
                effect: ShimmerEffect(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  duration: const Duration(seconds: 1),
                ),
                child: CustomPrivacyAndPolitecsContainer()),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 15,
          ),
        ),
      ],
    );
  }
}
