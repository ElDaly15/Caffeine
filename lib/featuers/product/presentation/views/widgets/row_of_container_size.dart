import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/presentation/views/widgets/container_of_size.dart';
import 'package:flutter/material.dart';

class RowOfContainerSizes extends StatefulWidget {
  const RowOfContainerSizes({super.key, required this.onChangeSize});
  final void Function(String value) onChangeSize;
  @override
  State<RowOfContainerSizes> createState() => _RowOfContainerSizesState();
}

class _RowOfContainerSizesState extends State<RowOfContainerSizes> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              index = 0;
              widget.onChangeSize('S');
            });
          },
          child: ContainerOfSize(
            isActive: index == 0,
            size: isArabic() ? 'صغير' : 'S',
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 1;
              widget.onChangeSize('M');
            });
          },
          child: ContainerOfSize(
            isActive: index == 1,
            size: isArabic() ? 'وسط' : 'M',
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            setState(() {
              index = 2;
              widget.onChangeSize('L');
            });
          },
          child: ContainerOfSize(
            isActive: index == 2,
            size: isArabic() ? 'كبير' : 'L',
          ),
        ),
      ],
    );
  }
}
