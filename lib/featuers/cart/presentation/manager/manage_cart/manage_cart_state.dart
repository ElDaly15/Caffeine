part of 'manage_cart_cubit.dart';

@immutable
sealed class ManageCartState {}

final class ManageCartInitial extends ManageCartState {}

//Increase And Decrease

final class ManageCartForIncreaseAndDecreaseLoading extends ManageCartState {}

final class ManageCartForIncreaseAndDecreaseFailuer extends ManageCartState {}

final class ManageCartForIncreaseAndDecreaseSuccess extends ManageCartState {}

//Resize

final class ManageCartForSizeLoading extends ManageCartState {}

final class ManageCartForSizeFailuer extends ManageCartState {}

final class ManageCartForSizeSuccess extends ManageCartState {}

//Delete

final class ManageCartForDeleteLoading extends ManageCartState {}

final class ManageCartForDeleteFailuer extends ManageCartState {}

final class ManageCartForDeleteSuccess extends ManageCartState {}
