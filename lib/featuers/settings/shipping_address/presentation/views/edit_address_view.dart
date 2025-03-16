import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/widgets/buttons/custom_snack_bar.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_address/manage_address_cubit.dart';
import 'package:caffeine/featuers/settings/shipping_address/presentation/views/widgets/edit_address_view_body.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class EditAddressView extends StatelessWidget {
  const EditAddressView({super.key, required this.addressModel});
  final AddressModel addressModel;

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<ManageAddressCubit, ManageAddressState>(
          listener: (context, state) {
            if (state is ManageAddressUpdateSuccess) {
              Navigator.pop(context);
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).address_edited_success,
                  type: AnimatedSnackBarType.success);
            }

            if (state is ManageAddressUpdateFailuer) {
              getIt<CustomSnackBar>().showCustomSnackBar(
                  context: context,
                  message: S.of(context).address_edit_error,
                  type: AnimatedSnackBarType.error);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is ManageAddressUpdateLoading,
              // ignore: deprecated_member_use
              color: Colors.white.withOpacity(0.5),
              progressIndicator: const CircularProgressIndicator(
                color: AppColors.mainColorTheme,
              ),
              child: EditAddressViewBody(
                addressModel: addressModel,
              ),
            );
          },
        ),
      ),
    );
  }
}
