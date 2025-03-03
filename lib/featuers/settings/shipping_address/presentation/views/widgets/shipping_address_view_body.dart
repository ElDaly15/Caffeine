import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/buttons/icon_btm_of_edit.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/add_address_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/edit_address_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/container_of_address.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class ShippingAddressViewBody extends StatefulWidget {
  const ShippingAddressViewBody({super.key});

  @override
  State<ShippingAddressViewBody> createState() =>
      _ShippingAddressViewBodyState();
}

class _ShippingAddressViewBodyState extends State<ShippingAddressViewBody> {
  bool hasAddress = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(),
          ),
          CustomHeaderWithTitleAndBackBtm(
            title: S.of(context).shipping_address,
            color: Colors.black,
          ),
          const SizedBox(
            height: 20,
          ),
          hasAddress
              ? ContainerOfAddress()
              : CustomBigElevatedBtmWithIcon(
                  onPressed: () {
                    g.Get.to(
                      () => const AddAddressView(),
                      transition: g.Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 600),
                    );
                    setState(() {
                      hasAddress = true;
                    });
                  },
                  title: S.of(context).add_address,
                  iconData: IconlyBold.plus,
                ),
          SizedBox(
            height: 10,
          ),
          Visibility(
            visible: hasAddress,
            child: Align(
              alignment: Alignment.centerRight,
              child: IconBtmOfEdit(
                onPressed: () {
                  g.Get.to(
                    () => const EditAddressView(),
                    transition: g.Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 600),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
