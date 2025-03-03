import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class AddAddressViewBody extends StatelessWidget {
  const AddAddressViewBody({super.key});

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
              title: S.of(context).add_address,
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
                CustomAddAddressField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  keyBoardType: TextInputType.streetAddress,
                  title: S.of(context).street,
                  onChanged: (value) {},
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
                CustomAddAddressField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  keyBoardType: TextInputType.streetAddress,
                  title: S.of(context).city,
                  onChanged: (value) {},
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
                CustomAddAddressField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  keyBoardType: TextInputType.streetAddress,
                  title: S.of(context).phone_number,
                  onChanged: (value) {},
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
                CustomAddAddressField(
                  controller: TextEditingController(),
                  maxLines: 1,
                  keyBoardType: TextInputType.streetAddress,
                  title: S.of(context).country,
                  onChanged: (value) {},
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
                title: S.of(context).add_address,
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
