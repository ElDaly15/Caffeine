import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_with_icon_and_text.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class ColumnOfAddressAndEditAndAddNote extends StatelessWidget {
  const ColumnOfAddressAndEditAndAddNote(
      {super.key, required this.editAddress, required this.addNote});
  final void Function() editAddress;
  final void Function() addNote;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jl. Kpg Sutoyo',
          style: TextStyles.font18SemiBold(context)
              .copyWith(color: AppColors.darkTheme),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.',
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
              title: S.of(context).add_note,
              iconData: IconlyLight.paper,
              onTap: addNote,
            ),
          ],
        ),
      ],
    );
  }
}
