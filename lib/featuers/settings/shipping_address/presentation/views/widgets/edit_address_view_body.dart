import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_edit_text_field.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class EditAddressViewBody extends StatelessWidget {
  const EditAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomHeaderWithTitleAndBackBtm(
              title: S.of(context).edit_address,
              color: Colors.black,
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).street,
                    style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomEditTextField(
                  textInputType: TextInputType.streetAddress,
                  title: S.of(context).street,
                  onChanged: (value) {},
                  textEditingController:
                      TextEditingController(text: '9-Street Maadi'),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).city,
                    style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomEditTextField(
                  textInputType: TextInputType.streetAddress,
                  title: S.of(context).city,
                  onChanged: (value) {},
                  textEditingController: TextEditingController(text: 'Cairo'),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).phone_number,
                    style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomEditTextField(
                  textInputType: TextInputType.phone,
                  title: S.of(context).phone_number,
                  onChanged: (value) {},
                  textEditingController:
                      TextEditingController(text: '010005005414'),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 15,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(S.of(context).country,
                    style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomEditTextField(
                  textInputType: TextInputType.streetAddress,
                  title: S.of(context).country,
                  onChanged: (value) {},
                  textEditingController: TextEditingController(text: 'Egypt'),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: const SizedBox(
              height: 25,
            ),
          ),
          SliverToBoxAdapter(
            child: CustomBigElvatedButtom(
                colorCode: 0xffC67C4E,
                colorOfTextCode: 0xffFFFFFF,
                title: S.of(context).save,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
