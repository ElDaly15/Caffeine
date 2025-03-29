import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  editProfileName({
    required String name,
  }) async {
    try {
      emit(EditProfileLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update({'name': name});

      emit(EditProfileSuccess());
    } catch (e) {
      emit(EditProfileFailuer());
    }
  }
}
