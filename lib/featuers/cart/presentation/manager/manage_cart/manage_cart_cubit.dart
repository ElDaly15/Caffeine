import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'manage_cart_state.dart';

class ManageCartCubit extends Cubit<ManageCartState> {
  ManageCartCubit() : super(ManageCartInitial());

  updateQuantity({required String productCode, required int quantity}) async {
    try {
      emit(ManageCartForIncreaseAndDecreaseLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      List<CartModel> cartItems =
          (documentSnapshot['cartItems'] as List<dynamic>).map((item) {
        return CartModel.fromJson(item);
      }).toList();

      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].orderProductCode == productCode) {
          cartItems[i].quantity = quantity;
          break;
        }
      }

      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update(
          {'cartItems': cartItems.map((item) => item.toJson()).toList()});

      emit(ManageCartForIncreaseAndDecreaseSuccess());
    } catch (e) {
      emit(ManageCartForIncreaseAndDecreaseFailuer());
    }
  }

  updateSize(
      {required String productCode,
      required String sizeEn,
      required String sizeAr}) async {
    try {
      emit(ManageCartForSizeLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      List<CartModel> cartItems =
          (documentSnapshot['cartItems'] as List<dynamic>).map((item) {
        return CartModel.fromJson(item);
      }).toList();

      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].orderProductCode == productCode) {
          cartItems[i].sizeEn = sizeEn;
          cartItems[i].sizeAr = sizeAr;
          break;
        }
      }

      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update(
          {'cartItems': cartItems.map((item) => item.toJson()).toList()});

      emit(ManageCartForSizeSuccess());
    } catch (e) {
      emit(ManageCartForSizeFailuer());
    }
  }
}
