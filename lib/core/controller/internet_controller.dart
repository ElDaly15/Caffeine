// ignore_for_file: depend_on_referenced_packages

import 'package:caffeine/core/utils/app_styles.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    // You can then access the first (or only) result like this:
    final connectivityResult = connectivityResults.first;
    if (connectivityResult == ConnectivityResult.none) {
      // ...

      Get.rawSnackbar(
          messageText: Text(
              isArabic()
                  ? 'تحقق من الاتصال بالانترنت'
                  : 'PLEASE CONNECT TO THE INTERNET',
              style: TextStyles.font20Medium(Get.context!)
                  .copyWith(color: Colors.white)),
          isDismissible: false,
          duration: const Duration(days: 1),
          backgroundColor: Colors.red[400]!,
          icon: const Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          margin: EdgeInsets.zero,
          snackStyle: SnackStyle.GROUNDED);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
