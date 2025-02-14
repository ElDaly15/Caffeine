import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/edit_address_view_body.dart';
import 'package:flutter/material.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: EditAddressViewBody(),
    );
  }
}
