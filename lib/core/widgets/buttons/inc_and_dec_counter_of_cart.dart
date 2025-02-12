import 'package:caffeine/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class IncreaseAndDecreaseContainer extends StatefulWidget {
  const IncreaseAndDecreaseContainer(
      {super.key, required this.counterOfProduct});
  final void Function(int value) counterOfProduct;
  @override
  State<IncreaseAndDecreaseContainer> createState() =>
      _IncreaseAndDecreaseContainerState();
}

class _IncreaseAndDecreaseContainerState
    extends State<IncreaseAndDecreaseContainer> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (counter > 1) {
                  counter--;
                  widget.counterOfProduct(counter);
                }
              });
            },
            icon: const Icon(Icons.remove),
            iconSize: 22, // Adjust icon size
            color: Colors.black,

            padding: EdgeInsets.zero,
            // Remove extra padding
          ),
          const SizedBox(width: 10),
          Text(
            counter.toString(),
            style: TextStyles.font18SemiBold(context),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              if (counter < 7) {
                setState(() {
                  counter++;
                  widget.counterOfProduct(counter);
                });
              }
            },
            icon: const Icon(Icons.add),
            color: Colors.black,
            iconSize: 22, // Adjust icon size
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
