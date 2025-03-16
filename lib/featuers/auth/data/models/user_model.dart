import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/featuers/auth/domain/entity/user_entity.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.name,
      required super.uid,
      required super.address,
      required super.note,
      required super.notificationToken,
      required super.image,
      required super.cartItems});

  factory UserModel.fromFirebase(User user, String notificationToken) {
    return UserModel(
        email: user.email ?? ' ',
        address: [],
        name: user.displayName ?? ' ',
        uid: user.uid,
        note: '',
        notificationToken: [notificationToken],
        image: 'https://i.imgur.com/530PyKL.png',
        cartItems: []);
  }
  factory UserModel.fromFireStore(Map<String, dynamic> doc) {
    return UserModel(
      note: doc['note'],
      notificationToken: doc['notificationToken'],
      email: doc['email'],
      image: doc['image'],
      name: doc['name'],
      uid: doc['uid'],
      address: (doc['address'] as List<dynamic>).map((item) {
        return AddressModel.fromJson(item);
      }).toList(),
      cartItems: (doc['cartItems'] as List<dynamic>).map((item) {
        return CartModel.fromJson(item);
      }).toList(),
    );
  }
}
