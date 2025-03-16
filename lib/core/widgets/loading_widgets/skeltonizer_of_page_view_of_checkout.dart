import 'package:caffeine/core/widgets/loading_widgets/loding_list.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_and_pick_up_check.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/deleiver_home_body.dart';
import 'package:caffeine/featuers/cart/presentation/views/widgets/pickup_body.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeltonizerOfPageViewOfCheckout extends StatefulWidget {
  const SkeltonizerOfPageViewOfCheckout({super.key});

  @override
  State<SkeltonizerOfPageViewOfCheckout> createState() =>
      _SkeltonizerOfPageViewOfCheckoutState();
}

class _SkeltonizerOfPageViewOfCheckoutState
    extends State<SkeltonizerOfPageViewOfCheckout> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          duration: const Duration(seconds: 1),
        ),
        enabled: true,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: DeleiverAndPickUpCheck(
                onChanged: (index) {
                  pageController.jumpToPage(index);
                },
              ),
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: [
                  DeleiverToHomeBody(
                      userModel: UserModel(
                          email: 'ads',
                          name: 'sdad',
                          uid: 'asdasd',
                          note: 'sdad',
                          notificationToken: [],
                          image: 'sdad',
                          cartItems: loadingListCart()),
                      cartItems: loadingListCart()),
                  PickupBody(
                    userModel: UserModel(
                        email: 'ads',
                        name: 'sdad',
                        uid: 'asdasd',
                        note: 'sdad',
                        notificationToken: [],
                        image: 'sdad',
                        cartItems: loadingListCart()),
                    cartItems: loadingListCart(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
