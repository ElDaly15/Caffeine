// ignore_for_file: file_names

import 'package:caffeine/core/models/address_model.dart';
import 'package:caffeine/featuers/cart/data/model/cart_model.dart';
import 'package:caffeine/featuers/payment/data/models/order_model.dart';

class UserEntity {
  final String email;
  final String name;
  final String image;
  final String uid;
  final List<dynamic> notificationToken;
  final String note;
  final List<CartModel> cartItems;
  final List<AddressModel> address;
  final List<OrderModel> orders;
  UserEntity(
      {required this.email,
      required this.orders,
      required this.name,
      required this.address,
      required this.uid,
      required this.note,
      required this.notificationToken,
      required this.image,
      required this.cartItems});

  toMap() {
    return {
      "email": email,
      "name": name,
      "notificationToken": notificationToken,
      "uid": uid,
      'image': image,
      'Orders': orders,
      'note': note,
      'address': address,
      'cartItems': cartItems
    };
  }
}
