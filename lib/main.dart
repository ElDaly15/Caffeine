import 'dart:io';

import 'package:caffeine/core/controller/depency_injection.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/manager/manage_language_cubit/manage_language_cubit.dart';
import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/core/service/supabase_storage.dart';
import 'package:caffeine/error_app.dart';
import 'package:caffeine/featuers/cart/presentation/manager/add_item_to_cart/add_item_to_cart_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/check_copoun/check_copoun_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/get_branches/get_branches_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_address/manage_address_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_cart/manage_cart_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_note/manage_note_cubit.dart';
import 'package:caffeine/featuers/cart/presentation/manager/search_branch/search_branch_cubit.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_ads/get_ads_cubit.dart';
import 'package:caffeine/featuers/payment/presentation/manager/add_order/add_order_cubit.dart';
import 'package:caffeine/featuers/product/presentation/manager/get_product_by_code/get_product_by_code_cubit.dart';
import 'package:caffeine/featuers/product/presentation/manager/manage_rating/magnage_rating_cubit.dart';
import 'package:caffeine/featuers/search/presentation/manager/search_products_cubit/search_products_cubit.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/manager/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/manager/update_user_image/update_user_image_cubit.dart';
import 'package:caffeine/featuers/splash/presentation/views/splash_view.dart';
import 'package:caffeine/firebase_options.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:caffeine/no_internet_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await SupabaseStorage.initSupabase();
    await SupabaseStorage.createBucket(bucketName: 'userImages');
    await CacheHelper().init();

    setUpSingleton();
    runApp(DevicePreview(
        enabled: kReleaseMode ? false : true,
        builder: (context) => BlocProvider(
              create: (context) => ManageLanguageCubit()..loadSavedLanguage(),
              child: const CaffeineApp(),
            )));
    DependencyInjection.init();
  } on SocketException {
    runApp(NoInternetApp());
  } catch (e) {
    runApp(ErrorApp());
  }
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
            BlocProvider(
              create: (context) => ManageCartCubit(),
            ),
            BlocProvider(
              create: (context) => ManageNoteCubit(),
            ),
            BlocProvider(
              create: (context) => ManageAddressCubit(),
            ),
            BlocProvider(
              create: (context) => CheckCopounCubit(),
            ),
            BlocProvider(
              create: (context) => GetBranchesCubit()..getBranches(),
            ),
            BlocProvider(
              create: (context) => SearchBranchCubit(),
            ),
            BlocProvider(
              create: (context) => AddOrderCubit(),
            ),
            BlocProvider(
              create: (context) => EditProfileCubit(),
            ),
            BlocProvider(
              create: (context) => UpdateUserImageCubit(),
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
