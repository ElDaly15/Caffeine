import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: SizedBox()),
          CustomHeaderWithTitleAndBackBtm(
              title: S.of(context).edit_note, color: Colors.black),
          const SizedBox(
            height: 10,
          ),
          Text(
            S.of(context).edit_note,
            style: TextStyles.font20Medium(context),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomAddAddressField(
            controller: TextEditingController(
              text: 'Note text',
            ),
            maxLines: 5,
            title: S.of(context).edit_note,
            onChanged: (value) {},
            keyBoardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBigElevatedBtmWithIcon(
              onPressed: () {
                Navigator.pop(context);
              },
              title: S.of(context).update_note,
              iconData: FontAwesomeIcons.floppyDisk)
        ],
      ),
    );
  }
}
