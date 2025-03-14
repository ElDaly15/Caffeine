part of 'add_item_to_cart_cubit.dart';

@immutable
sealed class AddItemToCartState {}

final class AddItemToCartInitial extends AddItemToCartState {}

final class AddItemToCartLoading extends AddItemToCartState {}

final class AddItemToCarSuccess extends AddItemToCartState {}

final class AddItemToCartFailuer extends AddItemToCartState {}
