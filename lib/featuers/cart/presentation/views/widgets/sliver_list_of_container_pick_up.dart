import 'package:caffeine/featuers/cart/data/model/branch_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_pick_up_cafe.dart';
import 'package:flutter/material.dart';

class SliverOfContainerOfPickUpCafe extends StatefulWidget {
  const SliverOfContainerOfPickUpCafe(
      {super.key,
      required this.onChanged,
      required this.branches,
      required this.onBranchSelected});
  final void Function(bool isChecked) onChanged;
  final List<BranchModel> branches;
  final void Function(BranchModel) onBranchSelected;
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
        itemCount: widget.branches.length <= 8 ? widget.branches.length : 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 22, right: 22, bottom: 10),
            child: ContainerOfCafePickUp(
              onBranchSelected: widget.onBranchSelected,
              branchModel: widget.branches[index],
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
