import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/auth/presentation/views/get_started_view.dart';
import 'package:caffeine/featuers/home/presentation/views/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 0.86).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.slowMiddle,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    _animationController.forward();

    Future.delayed(
        const Duration(milliseconds: 3500),
        () => FirebaseAuth.instance.currentUser != null
            ? g.Get.to(() => const HomeView(),
                transition: g.Transition.fade,
                duration: const Duration(milliseconds: 800))
            : g.Get.off(() => const GetStartedView(),
                transition: g.Transition.fade,
                duration: const Duration(milliseconds: 800)));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: Transform.scale(
                  scale: _scaleAnimation.value,
                  child: child,
                ),
              );
            },
            child: Image.asset(Assets.imagesLogoCaffeineErased),
          ),
        ),
      ],
    );
  }
}
