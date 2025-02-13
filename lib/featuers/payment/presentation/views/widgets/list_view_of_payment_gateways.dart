import 'package:caffeine/core/utils/app_images.dart';
import 'package:caffeine/featuers/payment/data/models/payment_item_model.dart';
import 'package:caffeine/featuers/payment/presentation/views/widgets/custom_payment_item.dart';
import 'package:flutter/material.dart';

class ListViewOfPaymentItems extends StatefulWidget {
  const ListViewOfPaymentItems({super.key, required this.onChanged});
  final void Function(String onChanged) onChanged;

  @override
  State<ListViewOfPaymentItems> createState() => _ListViewOfPaymentItemsState();
}

class _ListViewOfPaymentItemsState extends State<ListViewOfPaymentItems> {
  final List<PaymentItemModel> paymentItems = [
    PaymentItemModel(title: 'Card', image: Assets.imagesVisaCard),
    PaymentItemModel(title: 'Online Wallets', image: Assets.imagesWallets),
    PaymentItemModel(title: 'Cash', image: Assets.imagesCod),
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: paymentItems.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CustomPaymentItem(
              paymentItemModel: paymentItems[index],
              isChecked: selectedIndex == index,
              onChanged: () {
                setState(() {
                  widget.onChanged(paymentItems[index].title);
                  selectedIndex = index; // Update selected item index
                });
              },
            ),
          );
        },
      ),
    );
  }
}
