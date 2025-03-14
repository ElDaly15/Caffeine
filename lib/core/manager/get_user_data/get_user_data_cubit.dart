import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'get_user_data_state.dart';

class GetUserDataCubit extends Cubit<GetUserDataState> {
  GetUserDataCubit() : super(GetUserDataInitial());
  List<UserModel> userModel = [];

  void getUserData() {
    try {
      emit(GetUserDataLoading());
      FirebaseFirestore.instance
          .collection('UsersData')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .listen(
        (querySnapshot) {
          userModel = querySnapshot.docs
              .map((doc) => UserModel.fromFireStore(doc.data()))
              .toList();

          emit(GetUserDataSuccess(userModel: userModel[0]));
        },
      );
    } catch (e) {
      emit(GetUserDataFailuer());
    }
  }
}
