import 'package:caffeine/core/errors/failuer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name, BuildContext context);
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password, context);
  Future<Either<Failuer, UserEntity>> signInWithGoogle();
  Future addUserData({required UserEntity userEntity});
  Future<bool> searchUser({required String path, required String uid});
  Future<UserEntity> getUserData({required String path, required String uid});
  Future saveData({required UserEntity userEntity});
  Future<Either<Failuer, void>> deleteAccount();
  Future deleteData();
}
