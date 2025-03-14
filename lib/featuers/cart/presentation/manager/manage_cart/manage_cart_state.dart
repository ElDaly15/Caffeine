part of 'manage_cart_cubit.dart';

@immutable
sealed class ManageCartState {}

final class ManageCartInitial extends ManageCartState {}

final class ManageCartForIncreaseAndDecreaseLoading extends ManageCartState {}

final class ManageCartForIncreaseAndDecreaseFailuer extends ManageCartState {}

final class ManageCartForIncreaseAndDecreaseSuccess extends ManageCartState {}

final class ManageCartForSizeLoading extends ManageCartState {}

final class ManageCartForSizeFailuer extends ManageCartState {}

final class ManageCartForSizeSuccess extends ManageCartState {}
