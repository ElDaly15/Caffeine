import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'manage_note_state.dart';

class ManageNoteCubit extends Cubit<ManageNoteState> {
  ManageNoteCubit() : super(ManageNoteInitial());

  addNote(final String note) async {
    try {
      emit(ManageNoteAddOrUpdateLoading());
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Get Data You Want To Update First
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;

      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update({'note': note});

      emit(ManageNoteAddOrUpdateSuccess());
    } catch (e) {
      emit(ManageNoteAddOrUpdateFailuer());
    }
  }
}
