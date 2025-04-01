import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:restart_app/restart_app.dart';

class NoInternetApp extends StatelessWidget {
  const NoInternetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AlertDialog(
            backgroundColor: AppColors.mainColorTheme,
            title: Text(
              'No Internet Connection',
              style: TextStyles.font22SemiBold(context)
                  .copyWith(color: AppColors.secondaryColorTheme),
            ),
            content: Text(
              'Please check your internet connection and restart the app.',
              style: TextStyles.font14Medium(context)
                  .copyWith(color: AppColors.secondaryColorTheme),
            ),
            actions: [
              TextButton(
                onPressed: () => Restart.restartApp(),
                child: Text(
                  'Retry',
                  style: TextStyles.font22SemiBold(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
