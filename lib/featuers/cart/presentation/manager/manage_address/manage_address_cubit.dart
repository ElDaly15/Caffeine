import 'package:bloc/bloc.dart';
import 'package:caffeine/core/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'manage_address_state.dart';

class ManageAddressCubit extends Cubit<ManageAddressState> {
  ManageAddressCubit() : super(ManageAddressInitial());

  addAddress({required AddressModel addressModel}) async {
    try {
      emit(ManageAddressAddLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update({
        'address': FieldValue.arrayUnion([addressModel.toJson()])
      });

      emit(ManageAddressAddSuccess());
    } catch (e) {
      emit(ManageAddressAddFailuer());
    }
  }

  updateAddress({required AddressModel addressModel}) async {
    try {
      emit(ManageAddressUpdateLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update({
        'address': [addressModel.toJson()]
      });

      emit(ManageAddressUpdateSuccess());
    } catch (e) {
      emit(ManageAddressUpdateFailuer());
    }
  }
}
