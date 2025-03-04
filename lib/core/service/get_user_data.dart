import 'dart:convert';

import 'package:caffeine/core/helper/cached_helper.dart';
import 'package:caffeine/core/helper/singleton_helper.dart';
import 'package:caffeine/featuers/auth/data/models/user_model.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';

UserEntity getUser() {
  var userData = getIt<CacheHelper>().getData(key: 'userData');
  UserEntity userEntity = UserModel.fromFireStore(jsonDecode(userData));

  return userEntity;
}
