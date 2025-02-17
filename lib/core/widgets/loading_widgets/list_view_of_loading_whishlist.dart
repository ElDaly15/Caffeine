import 'package:caffeine/featuers/settings/whishlist/presentation/views/widgets/whishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ListViewOfWhishListItem extends StatelessWidget {
  const ListViewOfWhishListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 5, // You can adjust the count dynamically based on your data
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: WhishlistItem(
              onSwiped: (value) {},
            ),
          );
        },
      ),
    );
  }
}
