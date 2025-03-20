import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/payment/data/paymob_manger/paymob_mang.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconly/iconly.dart';

class CardView extends StatefulWidget {
  const CardView({
    super.key,
    required this.tprice,
  });
  final int tprice;

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  InAppWebViewController? inAppWebViewController;

  Future<void> _pay() async {
    PaymobManager()
        .getPaymentKey(widget.tprice, "EGP")
        .then((String paymentKey) {
      inAppWebViewController?.loadUrl(
          urlRequest: URLRequest(
        url: WebUri(
            "https://accept.paymob.com/api/acceptance/iframes/899702?payment_token=$paymentKey"),
      ));
    });
  }

  @override
  void initState() {
    super.initState();
    _pay();

    var data = CacheHelper().getData(key: 'userData');
    var finalData = jsonDecode(data);
    name = formatName(finalData['name']);
  }

// Helper method to format the name
  String formatName(String fullName) {
    List<String> nameParts = fullName.split(" ");
    if (nameParts.length >= 2) {
      String firstInitial = nameParts[0][0];
      String lastName = nameParts.sublist(1).join(" ");
      return "$firstInitial.$lastName";
    }
    return fullName; // Return the original name if formatting fails
  }

  String? image, name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColorTheme,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            S.of(context).card,
            style:
                TextStyles.font20Medium(context).copyWith(color: Colors.white),
          ),
          leading: IconButton(
            icon: Icon(
                isArabic()
                    ? IconlyLight.arrow_right_2
                    : IconlyLight.arrow_left_2,
                color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: InAppWebView(
          // ignore: deprecated_member_use
          initialOptions: InAppWebViewGroupOptions(
            // ignore: deprecated_member_use
            crossPlatform: InAppWebViewOptions(
              javaScriptEnabled: true,
            ),
          ),
          onWebViewCreated: (controller) {
            inAppWebViewController = controller;
            _pay();
          },
          onLoadStop: (controller, url) {
            if (url != null &&
                url.queryParameters.containsKey("success") &&
                url.queryParameters["success"] == "true") {
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).payment_success,
                  type: AnimatedSnackBarType.success);
            } else if (url != null &&
                url.queryParameters.containsKey("success") &&
                url.queryParameters["success"] == "false") {
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).payment_failed,
                  type: AnimatedSnackBarType.error);
            }
          },
        ));
  }
}
