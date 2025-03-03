import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/delete_account_list_tile.dart';
import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/dialog_of_remove_account.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class DeleteAccountViewBody extends StatelessWidget {
  const DeleteAccountViewBody({super.key});

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
              title: S.of(context).delete_account, color: Colors.black),
          SizedBox(
            height: 15,
          ),
          DeleteAccount(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteConfirmDialog();
                  });
            },
          ),
        ],
      ),
    );
  }
}
