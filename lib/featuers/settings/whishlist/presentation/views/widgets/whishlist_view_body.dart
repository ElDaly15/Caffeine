import 'package:caffeine/core/widgets/headers/header_with_title_and_bk_btm.dart';
import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/sliver_list_of_whishlist_items.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class WhishlistViewBody extends StatelessWidget {
  const WhishlistViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SafeArea(
              child: SizedBox(),
            ),
          ),
          SliverToBoxAdapter(
            child: CustomHeaderWithTitleAndBackBtm(
              title: S.of(context).wishlist,
              color: Colors.black,
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 15),
          ),
          SliverListOfWhishListItem(),
        ],
      ),
    );
  }
}
