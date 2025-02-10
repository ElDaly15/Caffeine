import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/custom_list_view_of_container_items.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              'Search Result',
              style: TextStyles.font22SemiBold(context),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          CustomListViewOfContainerItems(),
        ],
      ),
    );
  }
}
