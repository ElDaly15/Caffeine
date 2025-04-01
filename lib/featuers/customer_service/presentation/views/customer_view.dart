import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/core/utils/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColorTheme,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.secondaryColorTheme),
      ),
      body: Tawk(
        directChatLink: Consts.tawkLink,
        visitor: TawkVisitor(
          name: FirebaseAuth.instance.currentUser!.displayName,
          email: FirebaseAuth.instance.currentUser!.email,
        ),
        onLoad: () {},
        onLinkTap: (String url) {},
        placeholder: const Center(
            child: CircularProgressIndicator(
          color: AppColors.mainColorTheme,
        )),
      ),
    );
  }
}
