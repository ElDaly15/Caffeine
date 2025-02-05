import 'package:caffeine/core/utils/app_colors.dart';
import 'package:caffeine/featuers/auth/presentation/views/widgets/get_started_view_body.dart';
import 'package:flutter/material.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GetStartedViewBody(),
    );
  }
}
