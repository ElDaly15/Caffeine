import 'package:caffeine/core/controller/depency_injection.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/featuers/splash/presentation/views/splash_view.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  setUpSingleton();
  runApp(
      DevicePreview(enabled: true, builder: (context) => const CaffeineApp()));
  DependencyInjection.init();
}

class CaffeineApp extends StatelessWidget {
  const CaffeineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('ar'),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
