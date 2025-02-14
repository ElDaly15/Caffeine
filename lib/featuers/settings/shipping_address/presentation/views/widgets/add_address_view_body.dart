import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
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
              title: 'Add Address',
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
                Text('Street', style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomAddAddressField(
                  keyBoardType: TextInputType.streetAddress,
                  title: 'Street',
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
                Text('City', style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomAddAddressField(
                  keyBoardType: TextInputType.streetAddress,
                  title: 'City',
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
                Text('Phone Number', style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomAddAddressField(
                  keyBoardType: TextInputType.streetAddress,
                  title: 'Phone Number',
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
                Text('Country', style: TextStyles.font18SemiBold(context)),
                const SizedBox(
                  height: 7,
                ),
                CustomAddAddressField(
                  keyBoardType: TextInputType.streetAddress,
                  title: 'Country',
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
                title: 'Add Address',
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
