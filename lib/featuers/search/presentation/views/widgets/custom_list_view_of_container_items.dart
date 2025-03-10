import 'package:caffeine/featuers/search/presentation/views/widgets/container_of_search_item.dart';
import 'package:flutter/material.dart';

class CustomListViewOfContainerItems extends StatelessWidget {
  const CustomListViewOfContainerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 15, left: 16, right: 16),
            child: ContainerOfSearchItem(),
          );
        });
  }
}
