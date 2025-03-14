import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/container_of_cart_item.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingViewOfCartItems extends StatelessWidget {
  const LoadingViewOfCartItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        duration: const Duration(seconds: 1),
      ),
      enabled: true,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 6,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: ContainerOfCartItem(
                cartModel: CartModel(
                  productNameAr: 'كافيه لاتيه',
                  productNameEn: 'Caffe Latte',
                  productImage: 'https://i.imgur.com/Hveh20Q.png',
                  productCode: '123',
                  orderProductCode: '123',
                  productCategory: '123',
                  productPriceS: '123',
                  productPriceM: '123',
                  productPriceL: '123',
                  quantity: 1,
                  sizeEn: '123',
                  sizeAr: '123',
                ),
                counterOfProduct: (value) {},
                onSwiped: (value) {},
              ),
            );
          }),
    );
  }
}
