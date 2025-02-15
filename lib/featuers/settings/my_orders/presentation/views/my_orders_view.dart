import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: MyOrdersViewBody(),
    );
  }
}
