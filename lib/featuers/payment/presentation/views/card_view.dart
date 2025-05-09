// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/home/presentation/views/home_view.dart';
import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:caffeine/featuers/payment/data/paymob_manger/paymob_mang.dart';
import 'package:caffeine/featuers/payment/presentation/manager/add_order/add_order_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:iconly/iconly.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';

class CardView extends StatefulWidget {
  const CardView({
    super.key,
    this.branchModel,
    required this.tprice,
    required this.userModel,
    required this.orderStatus,
  });
  final int tprice;
  final UserModel userModel;
  final String orderStatus;
  final BranchModel? branchModel;

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
    return BlocConsumer<AddOrderCubit, AddOrderState>(
      listener: (context, state) {
        if (state is AddOrderFailuer) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: S.of(context).payment_failed,
              type: AnimatedSnackBarType.error);
        }

        if (state is AddOrderSuccess) {
          getIt<CustomSnackBar>().showCustomSnackBar(
              context: context,
              message: S.of(context).payment_success,
              type: AnimatedSnackBarType.success);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeView(),
            ),
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AddOrderLoading,
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.mainColorTheme,
          ),
          color: Colors.white.withOpacity(0.5),
          child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.mainColorTheme,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  S.of(context).card,
                  style: TextStyles.font20Medium(context)
                      .copyWith(color: Colors.white),
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
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                    javaScriptEnabled: true,
                  ),
                ),
                onWebViewCreated: (controller) {
                  inAppWebViewController = controller;
                  _pay();
                },
                onLoadStop: (controller, url) async {
                  if (url != null &&
                      url.queryParameters.containsKey("success") &&
                      url.queryParameters["success"] == "true") {
                    var orderId = Uuid();
                    OrderModel orderModel = OrderModel(
                      totalPrice: widget.tprice,
                      orderId: orderId.v4(),
                      branchModel: widget.branchModel,
                      statusOfOrder: 'Pending',
                      date: FieldValue.serverTimestamp(),
                      userId: widget.userModel.uid,
                      stepperValue: 0,
                      orderedBy: widget.orderStatus,
                      paymentMethod: 'Payment by card',
                      products: widget.userModel.cartItems,
                      note: widget.userModel.note,
                    );

                    BlocProvider.of<AddOrderCubit>(context)
                        .addOrder(orderModel: orderModel);
                  } else if (url != null &&
                      url.queryParameters.containsKey("success") &&
                      url.queryParameters["success"] == "false") {
                    getIt<CustomSnackBar>().showCustomSnackBar(
                        context: context,
                        message: S.of(context).payment_failed,
                        type: AnimatedSnackBarType.error);
                  }
                },
              )),
        );
      },
    );
  }
}
