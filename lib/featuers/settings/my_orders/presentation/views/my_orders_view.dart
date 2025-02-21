import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/featuers/settings/my_orders/presentation/views/widgets/my_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class MyOrdersView extends StatelessWidget {
  const MyOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: MyOrdersViewBody(),
      ),
    );
  }
}
