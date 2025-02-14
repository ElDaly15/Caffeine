import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/shipping_address_view_body.dart';
import 'package:flutter/material.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const ShippingAddressViewBody(),
    );
  }
}
