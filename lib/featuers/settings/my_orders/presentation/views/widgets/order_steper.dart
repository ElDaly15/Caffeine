import 'package:caffeine/core/utils/app_colors.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderStepper extends StatefulWidget {
  const OrderStepper({super.key, required this.step});
  final int step;

  @override
  State<OrderStepper> createState() => _OrderStepperState();
}

class _OrderStepperState extends State<OrderStepper> {
  int activeStep = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;

    // Define responsive parameters based on screen width
    bool isTablet = screenWidth >= 800;
    bool isBiggerMobile = screenWidth > 400 && screenWidth < 800;
    double stepRadius = isTablet ? 35 : 25; // Larger step radius for tablets
    double lineLength = isBiggerMobile
        ? 70
        : isTablet
            ? 200
            : 40; // Longer line length for larger screens
    double iconSize = isTablet ? 35 : 25; // Larger icons for tablets

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        EasyStepper(
          padding: EdgeInsets.zero,
          activeStepBorderColor: AppColors.mainColorTheme,
          stepRadius: stepRadius,
          activeStepIconColor: AppColors.mainColorTheme,
          activeStepBackgroundColor: AppColors.mainColorTheme,
          lineStyle: LineStyle(
            lineLength: lineLength,
            activeLineColor: AppColors.mainColorTheme,
            defaultLineColor: AppColors.mainColorTheme,
            finishedLineColor: AppColors.mainColorTheme,
            lineType: LineType.normal,
            unreachedLineType: LineType.dotted,
          ),
          activeStep: widget.step,
          direction: Axis.horizontal,
          unreachedStepIconColor: Colors.black,
          unreachedStepBorderColor: AppColors.mainColorTheme,
          finishedStepBackgroundColor: AppColors.mainColorTheme,
          unreachedStepBackgroundColor: AppColors.secondaryColorTheme,
          showTitle: false,
          // ignore: avoid_print
          onStepReached: (index) => setState(() => print(index)),
          steps: [
            EasyStep(
              customTitle: SizedBox(
                width: double.infinity,
                child: Text(
                  "Awaiting authorization",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize:
                          isTablet ? 18 : 14), // Larger text size for tablets
                ),
              ),
              topTitle: true,
              icon: Icon(CupertinoIcons.arrow_2_squarepath, size: iconSize),
              activeIcon:
                  Icon(CupertinoIcons.arrow_2_squarepath, size: iconSize),
            ),
            EasyStep(
              icon: Icon(Icons.local_shipping_outlined, size: iconSize),
              activeIcon: Icon(Icons.local_shipping_outlined, size: iconSize),
              topTitle: true,
            ),
            EasyStep(
              icon: Icon(Icons.done, size: iconSize),
              activeIcon: Icon(Icons.done, size: iconSize),
            ),
          ],
        ),
      ],
    );
  }
}
