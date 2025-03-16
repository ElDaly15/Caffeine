import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_with_icon_and_text.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ColumnOfAddressAndEditAndAddNote extends StatelessWidget {
  const ColumnOfAddressAndEditAndAddNote(
      {super.key,
      required this.editAddress,
      required this.addNote,
      required this.title,
      required this.addressModel});
  final void Function() editAddress;
  final void Function() addNote;
  final String title;
  final AddressModel addressModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          addressModel.city,
          style: TextStyles.font18SemiBold(context)
              .copyWith(color: AppColors.darkTheme),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '${addressModel.street} , ${addressModel.coutry}',
          style: TextStyles.font18SemiBold(context)
              .copyWith(color: Color(0xffA2A2A2)),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            CustomContainerWithIconAndText(
              title: S.of(context).edit_address,
              iconData: IconlyLight.edit_square,
              onTap: editAddress,
            ),
            SizedBox(
              width: 12,
            ),
            CustomContainerWithIconAndText(
              title: title,
              iconData: IconlyLight.paper,
              onTap: addNote,
            ),
          ],
        ),
      ],
    );
  }
}
