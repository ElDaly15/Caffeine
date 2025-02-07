import 'package:flutter/material.dart';

class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget(
      {super.key,
      required this.mobileLayout,
      required this.tabletLayout,
      required this.desktopLayout});

  final WidgetBuilder mobileLayout, tabletLayout, desktopLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraines) {
      // print(constraines.maxWidth);
      // print(MediaQuery.of(context).size.width);
      if (constraines.maxWidth < 800) {
        return mobileLayout(context);
      } else if (constraines.maxWidth < 1100) {
        return tabletLayout(context);
      } else {
        return desktopLayout(context);
      }
    });
  }
}
