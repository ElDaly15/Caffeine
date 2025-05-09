import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_note/manage_note_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final String note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? newNote;
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
            controller: TextEditingController(text: newNote ?? widget.note),
            maxLines: 5,
            title: S.of(context).edit_note,
            onChanged: (value) {
              newNote = value;
            },
            keyBoardType: TextInputType.text,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomBigElevatedBtmWithIcon(
              onPressed: () {
                BlocProvider.of<ManageNoteCubit>(context)
                    .addNote(newNote ?? widget.note);
              },
              title: S.of(context).update_note,
              iconData: FontAwesomeIcons.floppyDisk)
        ],
      ),
    );
  }
}
