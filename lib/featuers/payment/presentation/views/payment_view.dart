import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/payment_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class PaymentView extends StatelessWidget {
  const PaymentView(
      {super.key,
      required this.totalPrice,
      required this.userModel,
      required this.orderStatus,
      this.branchModel});
  final int totalPrice;
  final UserModel userModel;
  final BranchModel? branchModel;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PaymentViewBody(
          branchModel: branchModel,
          userModel: userModel,
          orderStatus: orderStatus,
          totalPrice: totalPrice,
        ),
      ),
    );
  }
}
