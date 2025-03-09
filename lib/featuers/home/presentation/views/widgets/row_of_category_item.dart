import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/home/presentation/manager/get_products/get_products_cubit.dart';
import 'package:caffeine/featuers/home/presentation/views/widgets/container_of_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final List<String> categoriesArabic = [
    "كل القهوة",
    "كابتشينو",
    "لاتيه",
    "إسبريسو",
    "أمريكانو",
    "ماكياتو"
  ];
  int indexOfItem = 0;

  void triggerCubit(int index) {
    if (index == 0) {
      BlocProvider.of<GetProductsCubit>(context).getProducts();
    } else {
      BlocProvider.of<GetProductsCubit>(context)
          .getProductsByCategory(category: categories[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return index == 0
                ? GestureDetector(
                    onTap: () {
                      triggerCubit(index);
                      setState(() {
                        indexOfItem = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 8),
                      child: ContainerOfCategoryItem(
                        isActive: indexOfItem == index,
                        categoryTitle: isArabic()
                            ? categoriesArabic[index]
                            : categories[index],
                      ),
                    ),
                  )
                : index == categories.length - 1
                    ? GestureDetector(
                        onTap: () {
                          triggerCubit(index);

                          setState(() {
                            indexOfItem = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 8),
                          child: ContainerOfCategoryItem(
                            isActive: indexOfItem == index,
                            categoryTitle: isArabic()
                                ? categoriesArabic[index]
                                : categories[index],
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          triggerCubit(index);

                          setState(() {
                            indexOfItem = index;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ContainerOfCategoryItem(
                            isActive: indexOfItem == index,
                            categoryTitle: isArabic()
                                ? categoriesArabic[index]
                                : categories[index],
                          ),
                        ),
                      );
          }),
    );
  }
}
