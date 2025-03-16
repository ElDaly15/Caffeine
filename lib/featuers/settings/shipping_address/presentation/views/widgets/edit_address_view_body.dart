import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/custom_big_elevated_btm.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_edit_text_field.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_address/manage_address_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditAddressViewBody extends StatefulWidget {
  const EditAddressViewBody({super.key, required this.addressModel});

  final AddressModel addressModel;

  @override
  State<EditAddressViewBody> createState() => _EditAddressViewBodyState();
}

class _EditAddressViewBodyState extends State<EditAddressViewBody> {
  String? city, phone, country, street;
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
                  onChanged: (value) {
                    street = value;
                  },
                  textEditingController: TextEditingController(
                      text: street ?? widget.addressModel.street),
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
                  onChanged: (value) {
                    city = value;
                  },
                  textEditingController: TextEditingController(
                      text: city ?? widget.addressModel.city),
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
                  onChanged: (value) {
                    phone = value;
                  },
                  textEditingController: TextEditingController(
                      text: phone ?? widget.addressModel.phoneNumber),
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
                  onChanged: (value) {
                    country = value;
                  },
                  textEditingController: TextEditingController(
                      text: country ?? widget.addressModel.coutry),
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
                  AddressModel addressModel = AddressModel(
                      city: city ?? widget.addressModel.city,
                      coutry: country ?? widget.addressModel.coutry,
                      phoneNumber: phone ?? widget.addressModel.phoneNumber,
                      street: street ?? widget.addressModel.street);

                  BlocProvider.of<ManageAddressCubit>(context)
                      .updateAddress(addressModel: addressModel);
                }),
          ),
        ],
      ),
    );
  }
}
