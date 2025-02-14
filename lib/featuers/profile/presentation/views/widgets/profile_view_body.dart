import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/container_of_list_tile_main_settings.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_privacy_and_politecs_container.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

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
            child: ContainerOfListTileSettings(),
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
            child: CustomPrivacyAndPolitecsContainer(),
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
