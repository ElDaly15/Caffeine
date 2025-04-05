import 'package:caffeine/core/errors/error_widget_with_header.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/headers/custom_header_of_main_caffeine_app.dart';
import 'package:caffeine/core/widgets/loading_widgets/notification_loading_view.dart';
import 'package:caffeine/featuers/notification/presentation/manager/get_notification_cubit/get_notifications_cubit.dart';
import 'package:caffeine/featuers/notification/presentation/views/widgets/sliver_list_view_of_notifaction.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetNotificationsCubit, GetNotificationsState>(
      builder: (context, state) {
        if (state is GetNotificationsSuccess) {
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
                  child: Text(S.of(context).notification,
                      style: TextStyles.font24SemiBold(context)),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10,
                ),
              ),
              SliverListViewOfNotifications(
                notifications: state.notifications,
              ),
            ],
          );
        } else if (state is GetNotificationsLoading) {
          return NotificationLoadingView();
        } else {
          return ErrorWidgetWithHeader();
        }
      },
    );
  }
}
