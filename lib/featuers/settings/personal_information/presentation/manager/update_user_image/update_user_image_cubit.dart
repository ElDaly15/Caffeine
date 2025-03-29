import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/service/supabase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'update_user_image_state.dart';

class UpdateUserImageCubit extends Cubit<UpdateUserImageState> {
  UpdateUserImageCubit() : super(UpdateUserImageInitial());

  void updateUserImage({required File? fileImage}) async {
    try {
      emit(UpdateUserImageLoading());

      String url = await SupabaseStorage()
          .uploadImage(file: fileImage!, path: 'userImages');
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance // Update Main User Data
              .collection('UsersData')
              .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .limit(1)
              .get();

      DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
      DocumentReference docRef = documentSnapshot.reference;

      await docRef.update({'image': url});

      var data = CacheHelper().getData(key: 'userData'); // Update Local
      var finalData = jsonDecode(data);
      finalData['image'] = url;

      CacheHelper().put(key: 'userData', value: jsonEncode(finalData));

      emit(UpdateUserImageSuccess());
    } on Exception {
      emit(UpdateUserImageFailuer());
    }
  }
}
