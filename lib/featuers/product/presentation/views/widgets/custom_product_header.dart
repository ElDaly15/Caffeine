import 'package:caffeine/core/manager/mange_favourite_products_cubit/manage_favourite_products_cubit.dart';
import 'package:caffeine/core/utils/app_styles.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

class CustommProductAppBarWithWhishlistTheItems extends StatefulWidget {
  const CustommProductAppBarWithWhishlistTheItems(
      {super.key, required this.onPressed, required this.productModel});
  final void Function() onPressed;

  final ProductModel productModel;

  @override
  State<CustommProductAppBarWithWhishlistTheItems> createState() =>
      _CustommProductAppBarWithWhishlistTheItemsState();
}

class _CustommProductAppBarWithWhishlistTheItemsState
    extends State<CustommProductAppBarWithWhishlistTheItems> {
  bool isLiked = false;
  @override
  void initState() {
    super.initState();
    isLiked = widget.productModel.favIds
        .any((like) => like == FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Spacer(),
        Text(
          S.of(context).detail,
          style: TextStyles.font20SemiBold(context).copyWith(),
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            isLiked ? IconlyBold.heart : IconlyLight.heart,
            color: isLiked ? Colors.red : Colors.black,
          ),
          onPressed: () {
            isLiked = !isLiked;
            setState(() {});
            bool checkLike = widget.productModel.favIds
                .any((like) => like == FirebaseAuth.instance.currentUser!.uid);
            if (checkLike) {
              BlocProvider.of<ManageFavouriteProductsCubit>(context)
                  .removeFavouriteProduct(
                      globalProductModel: widget.productModel);
            } else {
              BlocProvider.of<ManageFavouriteProductsCubit>(context)
                  .addFavouriteProduct(
                globalProductModel: widget.productModel,
              );
            }
          },
        ),
      ],
    );
  }
}
