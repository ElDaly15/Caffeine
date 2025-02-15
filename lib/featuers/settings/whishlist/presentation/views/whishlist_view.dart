import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/whishlist_view_body.dart';
import 'package:flutter/material.dart';

class WhishlistView extends StatelessWidget {
  const WhishlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WhishlistViewBody(),
    );
  }
}
