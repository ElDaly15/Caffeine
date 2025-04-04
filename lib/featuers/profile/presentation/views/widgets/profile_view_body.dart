import 'package:caffeine/core/errors/error_widget_with_header.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/core/widgets/loading_widgets/settings_Loading.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/container_of_list_tile_main_settings.dart';
import 'package:caffeine/featuers/profile/presentation/views/widgets/custom_privacy_and_politecs_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserDataCubit>(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserDataCubit, GetUserDataState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
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
        } else if (state is GetUserDataLoading) {
          return const SettingsLoading();
        } else {
          return ErrorWidgetWithHeader();
        }
      },
    );
  }
}
