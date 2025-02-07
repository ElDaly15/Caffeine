import 'package:caffeine/core/helper/layout_builder.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/home_mobile_layout.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/home_tablet_layout.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilderWidget(
      mobileLayout: (context) => HomeMobileLayout(),
      tabletLayout: (context) => HomeTabletLayout(),
      desktopLayout: (context) => HomeTabletLayout(),
    );
  }
}
