import 'package:caffeine/core/errors/eror_widget_for_caffeine.dart';
import 'package:caffeine/core/manager/get_user_data/get_user_data_cubit.dart';
import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/buttons/icon_btm_of_edit.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/add_address_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/edit_address_view.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/container_of_address.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart' as g;

class ShippingAddressViewBody extends StatefulWidget {
  const ShippingAddressViewBody({super.key});

  @override
  State<ShippingAddressViewBody> createState() =>
      _ShippingAddressViewBodyState();
}

class _ShippingAddressViewBodyState extends State<ShippingAddressViewBody> {
  bool hasAddress = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SafeArea(
            child: SizedBox(),
          ),
          CustomHeaderWithTitleAndBackBtm(
            title: S.of(context).shipping_address,
            color: Colors.black,
          ),
          BlocBuilder<GetUserDataCubit, GetUserDataState>(
            builder: (context, state) {
              if (state is GetUserDataSuccess) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    state.userModel.address.isNotEmpty
                        ? ContainerOfAddress(
                            addressModel: state.userModel.address.first,
                          )
                        : CustomBigElevatedBtmWithIcon(
                            onPressed: () {
                              g.Get.to(
                                () => const AddAddressView(),
                                transition: g.Transition.leftToRightWithFade,
                                duration: const Duration(milliseconds: 600),
                              );
                              setState(() {
                                hasAddress = true;
                              });
                            },
                            title: S.of(context).add_address,
                            iconData: IconlyBold.plus,
                          ),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                      visible: state.userModel.address.isNotEmpty,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconBtmOfEdit(
                          onPressed: () {
                            g.Get.to(
                              () => EditAddressView(
                                addressModel: AddressModel(
                                  street: state.userModel.address.first.street,
                                  city: state.userModel.address.first.city,
                                  phoneNumber:
                                      state.userModel.address.first.phoneNumber,
                                  coutry: state.userModel.address.first.coutry,
                                ),
                              ),
                              transition: g.Transition.leftToRightWithFade,
                              duration: const Duration(milliseconds: 600),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else if (state is GetUserDataLoading) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppColors.mainColorTheme,
                    ),
                  ),
                );
              } else {
                return Expanded(child: ErrorWidgetForCaffeineApp());
              }
            },
          ),
        ],
      ),
    );
  }
}
