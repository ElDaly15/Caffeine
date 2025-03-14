import 'package:caffeine/core/controller/depency_injection.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/manager/manage_language_cubit/manage_language_cubit.dart';
import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/add_item_to_cart/add_item_to_cart_cubit.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_ads/get_ads_cubit.dart';
import 'package:caffeine/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine/featuers/product/presentation/manager/manage_rating/magnage_rating_cubit.dart';
import 'package:caffeine/featuers/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:caffeine/featuers/splash/presentation/views/splash_view.dart';
import 'package:caffeine/firebase_options.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper().init();

  setUpSingleton();

  runApp(DevicePreview(
      enabled: kReleaseMode ? false : true,
      builder: (context) => BlocProvider(
            create: (context) => ManageLanguageCubit()..loadSavedLanguage(),
            child: const CaffeineApp(),
          )));
  DependencyInjection.init();
}

class CaffeineApp extends StatelessWidget {
  const CaffeineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageLanguageCubit, ManageLanguageState>(
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ManageFavouriteProductsCubit(),
            ),
            BlocProvider(
              create: (context) => GetProductByCodeCubit(),
            ),
            BlocProvider(
              create: (context) => MagnageRatingCubit(),
            ),
            BlocProvider(
              create: (context) => GetAdsCubit()..getAds(),
            ),
            BlocProvider(
              create: (context) => SearchProductsCubit(),
            ),
            BlocProvider(
              create: (context) => AddItemToCartCubit(),
            ),
            BlocProvider(
              create: (context) => GetUserDataCubit()..getUserData(),
            ),
          ],
          child: GetMaterialApp(
            key: ValueKey(
                state.locale.languageCode), // Force rebuild on language change
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: state.locale,
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            home: SplashView(),
          ),
        );
      },
    );
  }
}
