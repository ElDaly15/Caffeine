import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/whishlist_item.dart';
import 'package:flutter/material.dart';

class SliverListOfWhishListItem extends StatelessWidget {
  const SliverListOfWhishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: WhishlistItem(
                  onSwiped: (value) {},
                ),
              ),
          childCount: 5),
    );
  }
}
