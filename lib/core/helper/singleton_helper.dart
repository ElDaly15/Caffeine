import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setUpSingleton() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<CustomSnackBar>(CustomSnackBar());
}
