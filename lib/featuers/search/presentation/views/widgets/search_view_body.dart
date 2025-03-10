import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/search/presentation/views/widgets/custom_list_view_of_container_items.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                S.of(context).search_result,
                style: TextStyles.font22SemiBold(context),
              ),
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
