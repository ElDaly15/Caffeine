import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.email,
    required super.name,
    required super.uid,
    required super.notificationToken,
    required super.image,
  });

  factory UserModel.fromFirebase(User user, String notificationToken) {
    return UserModel(
      email: user.email ?? ' ',
      name: user.displayName ?? ' ',
      uid: user.uid,
      notificationToken: [notificationToken],
      image: 'https://i.imgur.com/530PyKL.png',
    );
  }
  factory UserModel.fromFireStore(Map<String, dynamic> doc) {
    return UserModel(
      notificationToken: doc['notificationToken'],
      email: doc['email'],
      image: doc['image'],
      name: doc['name'],
      uid: doc['uid'],
    );
  }
}
