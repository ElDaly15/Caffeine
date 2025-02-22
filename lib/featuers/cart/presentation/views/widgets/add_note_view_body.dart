import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNoteViewBody extends StatelessWidget {
  const AddNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(child: SizedBox()),
          CustomHeaderWithTitleAndBackBtm(
              title: 'Add Note', color: Colors.black),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add a note to your order',
            style: TextStyles.font20Medium(context),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomAddAddressField(
            controller: TextEditingController(),
            maxLines: 5,
            title: 'Add Note',
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
              title: 'Save',
              iconData: FontAwesomeIcons.floppyDisk)
        ],
      ),
    );
  }
}
