import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_edit_text_field.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditInformationDataViewBody extends StatelessWidget {
  const EditInformationDataViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(child: SizedBox()),
          CustomHeaderWithTitleAndBackBtm(
              title: S.of(context).personal_information, color: Colors.black),
          SizedBox(
            height: 15,
          ),
          CustomEditTextField(
            title: S.of(context).name,
            onChanged: (value) {},
            textEditingController: TextEditingController(text: 'John Doe'),
            textInputType: TextInputType.text,
          ),
          const SizedBox(
            height: 15,
          ),
          CustomBigElvatedButtom(
              colorCode: 0xffC67C4E,
              colorOfTextCode: 0xffFFFFFF,
              title: S.of(context).save,
              onPressed: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
