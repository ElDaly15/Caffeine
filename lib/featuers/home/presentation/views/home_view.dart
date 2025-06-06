import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/cart/presentation/views/cart_view.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/home_view_body.dart';
import 'package:caffeine/featuers/notification/presentation/views/notification_view.dart';
import 'package:caffeine/featuers/profile/presentation/views/profile_view.dart';
// ignore: unnecessary_import
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:iconly/iconly.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;
  Duration animationDuration = const Duration(milliseconds: 300);

  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: BlocProvider(
        create: (context) => GetProductsCubit()..getProducts(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              HomeViewBody(),
              NotificationView(),
              CartView(),
              ProfileView(),
            ],
          ),
          bottomNavigationBar: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, IconlyBold.home, IconlyLight.home),
                _buildNavItem(
                    1, IconlyBold.notification, IconlyLight.notification),
                _buildNavItem(2, IconlyBold.bag, IconlyLight.bag),
                _buildNavItem(3, IconlyBold.profile, IconlyLight.profile),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int itemIndex, IconData selectedIcon, IconData unselectedIcon) {
    bool isSelected = index == itemIndex;
    return GestureDetector(
      onTap: () {
        setState(() {
          index = itemIndex;
          pageController.jumpToPage(itemIndex);
        });
      },
      child: AnimatedContainer(
        duration: animationDuration,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected
              // ignore: deprecated_member_use
              ? AppColors.mainColorTheme.withOpacity(0.2)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: AnimatedSwitcher(
          duration: animationDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Icon(
            isSelected ? selectedIcon : unselectedIcon,
            key: ValueKey<bool>(isSelected),
            color: isSelected ? AppColors.mainColorTheme : Colors.black,
          ),
        ),
      ),
    );
  }
}
