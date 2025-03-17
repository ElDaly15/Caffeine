// ignore_for_file: use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:caffeine/featuers/cart/data/model/coupon_model.dart';
import 'package:caffeine/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

part 'check_copoun_state.dart';

class CheckCopounCubit extends Cubit<CheckCopounState> {
  CheckCopounCubit() : super(CheckCopounInitial());

  void checkCopoun(
      {required String code, required BuildContext context}) async {
    try {
      emit(CheckCopounLoading());

      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('copouns').get();

      bool found = false;

      for (var doc in querySnapshot.docs) {
        CouponModel couponModel =
            CouponModel.fromJson(doc.data() as Map<String, dynamic>);

        if (couponModel.copounCode == code) {
          emit(CheckCopounSuccess(couponModel: couponModel));
          found = true;
          break; // توقف عن البحث بعد العثور على الكوبون
        }
      }

      if (!found) {
        emit(CheckCopounFailuer(
          msg: S.of(context).copoun_not_found,
        ));
      }
    } catch (e) {
      emit(CheckCopounFailuer(
        msg: S.of(context).error_occurred,
      ));
    }
  }
}
