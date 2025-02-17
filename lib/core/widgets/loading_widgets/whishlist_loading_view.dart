import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/core/widgets/loading_widgets/list_view_of_loading_whishlist.dart';
import 'package:flutter/material.dart';

class WhishlistLoadingView extends StatelessWidget {
  const WhishlistLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(
            child: SizedBox(),
          ),
          const CustomHeaderWithTitleAndBackBtm(
            title: 'Whishlist',
            color: Colors.black,
          ),
          const SizedBox(height: 15),
          Expanded(
            child: ListViewOfWhishListItem(),
          ),
        ],
      ),
    );
  }
}
