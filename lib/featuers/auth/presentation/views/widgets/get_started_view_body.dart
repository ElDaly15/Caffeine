import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/auth/presentation/views/login_view.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/get_started_column.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Image.asset(
                Assets.imagesCoffeeBk,
                width: double.infinity,
                height: h >= 800 && h < 1000
                    ? MediaQuery.of(context).size.height * 0.78
                    : h >= 1000
                        ? MediaQuery.of(context).size.height * 0.85
                        : MediaQuery.of(context).size.height * 0.68,
                // Makes the image take full width
                fit: BoxFit.cover, // Adjusts how the image is displayed
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.06,
          right: 0,
          left: 0,
          child: GetStartedColumn(
            onPressed: () {
              g.Get.to(() => const LoginView(),
                  transition: g.Transition.fade,
                  duration: const Duration(milliseconds: 600));
            },
          ),
        ),
      ],
    );
  }
}
