import 'package:caffeine/core/screens/no_connection_screen.dart';
import 'package:caffeine/featuers/settings/personal_information/presentation/views/widgets/edit_information_data_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class EditInformationDataView extends StatelessWidget {
  const EditInformationDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connection = value.first != ConnectivityResult.none;
        return connection ? child : const NoconnectionScreen();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: EditInformationDataViewBody(),
      ),
    );
  }
}
