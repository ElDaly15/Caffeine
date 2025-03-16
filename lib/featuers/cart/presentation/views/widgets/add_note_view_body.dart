import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/core/widgets/buttons/big_elevated_btm_with_icon.dart';
import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/text_fields/custom_add_address_field.dart';
import 'package:caffeine/featuers/cart/presentation/manager/manage_note/manage_note_cubit.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  String? note;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Form(
        key: _formKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox()),
            CustomHeaderWithTitleAndBackBtm(
                title: S.of(context).add_note, color: Colors.black),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).add_note_to_order,
              style: TextStyles.font20Medium(context),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomAddAddressField(
              maxLines: 5,
              title: S.of(context).add_note,
              onChanged: (value) {
                note = value;
              },
              keyBoardType: TextInputType.text,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomBigElevatedBtmWithIcon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    BlocProvider.of<ManageNoteCubit>(context).addNote(note!);
                  } else {
                    setState(() {
                      _autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: S.of(context).save,
                iconData: FontAwesomeIcons.floppyDisk)
          ],
        ),
      ),
    );
  }
}
