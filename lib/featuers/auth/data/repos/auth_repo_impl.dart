import 'dart:convert';
import 'package:caffeine/core/errors/exceptions.dart';
import 'package:caffeine/core/errors/failuer.dart';
import 'package:caffeine/core/helper/cached_helper.dart' show CacheHelper;
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/core/service/dataBase_services.dart';
import 'package:caffeine/core/service/fire_base_services.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:caffeine/featuers/auth/domain/repos/auth_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';

class AuthRepoImpl extends AuthRepo {
  final FireBaseServices fireBaseServices;
  final DatabaseServices databaseServices;
  final _messaging = FirebaseMessaging.instance;

  AuthRepoImpl(
      {required this.fireBaseServices, required this.databaseServices});

  @override
  Future<Either<Failuer, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
    BuildContext context,
  ) async {
    User? user;
    try {
      user = await fireBaseServices.createUserWithEmailAndPassword(
          email: email, password: password, name: name, context: context);

      final token = await _messaging.getToken();

      await addUserData(userEntity: UserModel.fromFirebase(user, token!));

      return right(UserModel.fromFirebase(user, token));
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: e.message));
    } catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: 'An error occurred. Please try again.'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      String email, String password, context) async {
    try {
      var user = await fireBaseServices.signInWithEmailAndPassword(
        email: email,
        password: password,
        context: context,
      );
      final token = await _messaging.getToken();
      await FirebaseFirestore.instance
          .collection('UsersData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'notificationToken': FieldValue.arrayUnion([token]),
      });
      UserEntity userEntity =
          await getUserData(path: 'UsersData', uid: user.uid);

      await getIt<AuthRepo>().saveData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(Failuer(message: e.message));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithGoogle() async {
    User? user;
    final token = await _messaging.getToken();
    try {
      user = await fireBaseServices.signInWithGoogle();

      bool checkData = await searchUser(path: 'UsersData', uid: user.uid);
      if (!checkData) {
        await addUserData(userEntity: UserModel.fromFirebase(user, token!));
      }
      await FirebaseFirestore.instance
          .collection('UsersData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'notificationToken': FieldValue.arrayUnion([token]),
      });

      UserEntity userEntity =
          await getUserData(path: 'UsersData', uid: user.uid);

      await getIt<AuthRepo>().saveData(userEntity: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: e.message));
    } catch (e) {
      if (user != null) {
        await fireBaseServices.deleteAccount();
      }
      return left(Failuer(message: 'An error occurred. Please try again.'));
    }
  }

  @override
  @override
  Future addUserData({required UserEntity userEntity}) async {
    try {
      await databaseServices.addData(userEntity.uid,
          path: 'UsersData', data: userEntity.toMap());
    } catch (e) {
      throw CustomException(message: 'An error occurred. Please try again.');
    }
  }

  @override
  Future<bool> searchUser({required String path, required String uid}) async {
    bool value = await databaseServices.searchUser(path: path, uid: uid);
    return value;
  }

  @override
  Future<UserEntity> getUserData(
      {required String path, required String uid}) async {
    return UserModel.fromFireStore(
        await databaseServices.getData(path: path, documentId: uid));
  }

  @override
  Future saveData({required UserEntity userEntity}) async {
    var jsonData = jsonEncode(userEntity.toMap());
    await getIt<CacheHelper>().saveData(key: 'userData', value: jsonData);
  }

  @override
  Future deleteData() async {
    await getIt<CacheHelper>().removeData(key: 'userData');
  }

  @override
  Future<Either<Failuer, void>> deleteAccount() async {
    try {
      var userId = FirebaseAuth.instance.currentUser!.uid;
      await getIt<FireBaseServices>().signOut();
      await FirebaseFirestore.instance
          .collection('UsersData')
          .doc(userId)
          .delete();
      await FirebaseAuth.instance.currentUser?.delete();

      return right(null);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        return left(Failuer(message: 'Please login again.'));
      } else {
        return left(Failuer(message: 'An error occurred. Please try again.'));
      }
    }
  }
}
