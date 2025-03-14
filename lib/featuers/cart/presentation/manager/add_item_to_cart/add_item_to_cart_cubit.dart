import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'add_item_to_cart_state.dart';

class AddItemToCartCubit extends Cubit<AddItemToCartState> {
  AddItemToCartCubit() : super(AddItemToCartInitial());

  addItemToCart({required CartModel cartModel}) async {
    try {
      emit(AddItemToCartLoading());
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

      bool checkExist = false;

      for (int i = 0; i < cartItems.length; i++) {
        if (cartItems[i].productCode == cartModel.productCode &&
            cartItems[i].size == cartModel.size) {
          cartItems[i].quantity += cartModel.quantity;
          checkExist = true;
          break;
        }
      }
      DocumentReference docRef = documentSnapshot.reference;

      if (checkExist) {
        docRef.update({
          'cartItems': cartItems.map((item) => item.toJson()).toList(),
        });
      } else {
        docRef.update({
          'cartItems': FieldValue.arrayUnion([cartModel.toJson()])
        });
      }

      emit(AddItemToCarSuccess());
    } catch (e) {
      emit(AddItemToCartFailuer());
    }
  }
}
