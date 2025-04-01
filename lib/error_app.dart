import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:restart_app/restart_app.dart';

class ErrorApp extends StatelessWidget {
  const ErrorApp({super.key});

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
              'An Error Occurred',
              style: TextStyles.font22SemiBold(context)
                  .copyWith(color: AppColors.secondaryColorTheme),
            ),
            content: Text(
              'Please restart the app.',
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
