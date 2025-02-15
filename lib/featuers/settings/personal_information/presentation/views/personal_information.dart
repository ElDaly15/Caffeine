import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/personal_information_body.dart';
import 'package:flutter/material.dart';

class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PersonalInformationBody(),
    );
  }
}
