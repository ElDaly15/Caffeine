import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/product/data/model/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'manage_favourite_products_state.dart';

class ManageFavouriteProductsCubit extends Cubit<ManageFavouriteProductsState> {
  ManageFavouriteProductsCubit() : super(ManageFavouriteProductsInitial());

  void addFavouriteProduct({required ProductModel globalProductModel}) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('UsersData')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('UsersData')
          .doc(querySnapshot.docs.first.id)
          .update({
        'favoritProduct': FieldValue.arrayUnion(
          [
            globalProductModel.toJson(),
          ],
        ),
      });
    }
    QuerySnapshot querySnapshotForProduct = await FirebaseFirestore.instance
        .collection('products')
        .where('productCode', isEqualTo: globalProductModel.productCode)
        .get();

    if (querySnapshotForProduct.docs.isNotEmpty) {
      await FirebaseFirestore.instance
          .collection('products')
          .doc(querySnapshotForProduct.docs.first.id)
          .update({
        'favIds': FieldValue.arrayUnion(
          [FirebaseAuth.instance.currentUser!.uid],
        ),
      });
    }
  }

  void removeFavouriteProduct(
      {required ProductModel globalProductModel}) async {
    try {
      emit(ManageFavouriteProductsLoading());

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('UsersData')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      List<dynamic> favoriteProducts =
          querySnapshot.docs.first['favoritProduct'] ?? [];
      ProductModel? globalProductModelNew;

      for (int i = 0; i < favoriteProducts.length; i++) {
        if (favoriteProducts[i]['productCode'] ==
            globalProductModel.productCode) {
          globalProductModelNew = ProductModel.fromJson(favoriteProducts[i]);
          break;
        }
      }

      if (querySnapshot.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('UsersData')
            .doc(querySnapshot.docs.first.id)
            .update({
          'favoritProduct': FieldValue.arrayRemove(
            [
              globalProductModelNew!.toJson(),
            ],
          ),
        });
      }

      QuerySnapshot querySnapshotForProduct = await FirebaseFirestore.instance
          .collection('products')
          .where('productCode', isEqualTo: globalProductModel.productCode)
          .get();

      if (querySnapshotForProduct.docs.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('products')
            .doc(querySnapshotForProduct.docs.first.id)
            .update({
          'favIds': FieldValue.arrayRemove(
            [
              FirebaseAuth.instance.currentUser!.uid,
            ],
          ),
        });
      }

      emit(ManageFavouriteProductsSuccess());
    } on Exception {
      emit(ManageFavouriteProductsFailuer());
    }
  }
}
