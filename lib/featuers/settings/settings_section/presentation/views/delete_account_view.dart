import 'package:caffeine/featuers/settings/settings_section/presentation/views/widgets/delete_account_view_body.dart';
import 'package:flutter/material.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const DeleteAccountViewBody(),
    );
  }
}
