import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/payment/data/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit() : super(AddOrderInitial());

  void addOrder({required OrderModel orderModel}) async {
    try {
      emit(AddOrderLoading());

      CollectionReference orderAdd =
          FirebaseFirestore.instance.collection('Orders');

      DocumentReference newOrderRef = orderAdd.doc();

      await newOrderRef.set({
        ...orderModel.toMap(),
        'date': FieldValue.serverTimestamp(),
      });

      DocumentSnapshot newOrderSnapshot = await newOrderRef.get();
      Map<String, dynamic> savedOrderData =
          newOrderSnapshot.data() as Map<String, dynamic>;

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('UsersData')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .limit(1)
          .get();

      if (querySnapshot.docs.isEmpty) {
        emit(AddOrderFailuer());
        return;
      }

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      // Step 3: Update user data with the saved order (which now has the timestamp)
      await docRef.update({
        'cartItems': [],
        'note': '',
        'Orders': FieldValue.arrayUnion([savedOrderData])
      });

      emit(AddOrderSuccess());
    } catch (e) {
      emit(AddOrderFailuer());
    }
  }
}
