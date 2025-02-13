import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_pick_up_cafe.dart';
import 'package:flutter/material.dart';

class SliverOfContainerOfPickUpCafe extends StatefulWidget {
  const SliverOfContainerOfPickUpCafe({super.key, required this.onChanged});
  final void Function(bool isChecked) onChanged;

  @override
  State<SliverOfContainerOfPickUpCafe> createState() =>
      _SliverOfContainerOfPickUpCafeState();
}

class _SliverOfContainerOfPickUpCafeState
    extends State<SliverOfContainerOfPickUpCafe> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
            child: ContainerOfCafePickUp(
              isChecked: selectedIndex == index,
              onChanged: () {
                setState(() {
                  selectedIndex = index;
                  widget.onChanged(true);
                });
              },
            ),
          );
        });
  }
}
