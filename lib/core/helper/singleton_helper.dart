import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/service/fire_base_services.dart';
import 'package:caffeine/core/service/firestore_services.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/auth/data/repos/auth_repo_impl.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
import 'package:get_it/get_it.dart';

var getIt = GetIt.instance;

void setUpSingleton() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<CustomSnackBar>(CustomSnackBar());
  getIt.registerSingleton<FireBaseServices>(FireBaseServices());
  getIt.registerSingleton<FireStoreServices>(FireStoreServices());
  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(
      fireBaseServices: getIt<FireBaseServices>(),
      databaseServices: getIt<FireStoreServices>()));
}
