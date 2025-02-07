import 'package:caffeine/featuers/home/presentation/views/widgets/container_of_category_item.dart';
import 'package:flutter/material.dart';

class RowOfCategoryItems extends StatefulWidget {
  const RowOfCategoryItems({super.key});

  @override
  State<RowOfCategoryItems> createState() => _RowOfCategoryItemsState();
}

class _RowOfCategoryItemsState extends State<RowOfCategoryItems> {
  final List<String> categories = [
    'All Coffee',
    'Cappuccino',
    'Latte',
    'Espresso',
    'Americano',
    'Macchiato'
  ];
  int indexOfItem = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return index == 0
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        indexOfItem = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22, right: 8),
                      child: ContainerOfCategoryItem(
                        isActive: indexOfItem == index,
                        categoryTitle: categories[index],
                      ),
                    ),
                  )
                : index == categories.length - 1
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            indexOfItem = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 22, left: 8),
                          child: ContainerOfCategoryItem(
                            isActive: indexOfItem == index,
                            categoryTitle: categories[index],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            indexOfItem = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ContainerOfCategoryItem(
                            isActive: indexOfItem == index,
                            categoryTitle: categories[index],
                          ),
                        ),
                      );
          }),
    );
  }
}
