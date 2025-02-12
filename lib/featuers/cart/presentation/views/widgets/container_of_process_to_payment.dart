import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ContainerOfProcessToPayment extends StatelessWidget {
  const ContainerOfProcessToPayment({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      height: 100,
      child: CustomBigElevatedBtmWithIcon(
          onPressed: onPressed,
          title: 'Proceed to Payment',
          iconData: IconlyBold.arrow_right_2),
    );
  }
}
