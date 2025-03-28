import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/row_of_address_info.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class ContainerOfAddress extends StatelessWidget {
  const ContainerOfAddress({super.key, required this.addressModel});
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Column(
        children: [
          RowOfAddressInfo(
            title: '${S.of(context).street}: ',
            subTitle: addressModel.street,
          ),
          const SizedBox(
            height: 10,
          ),
          RowOfAddressInfo(
            title: '${S.of(context).city}: ',
            subTitle: addressModel.city,
          ),
          const SizedBox(
            height: 10,
          ),
          RowOfAddressInfo(
            title: '${S.of(context).phone_number}: ',
            subTitle: addressModel.phoneNumber,
          ),
          const SizedBox(
            height: 10,
          ),
          RowOfAddressInfo(
            title: '${S.of(context).country}: ',
            subTitle: addressModel.coutry,
          ),
        ],
      ),
    );
  }
}
