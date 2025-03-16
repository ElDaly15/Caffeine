part of 'manage_address_cubit.dart';

@immutable
sealed class ManageAddressState {}

//Add
final class ManageAddressInitial extends ManageAddressState {}

final class ManageAddressAddSuccess extends ManageAddressState {}

final class ManageAddressAddFailuer extends ManageAddressState {}

final class ManageAddressAddLoading extends ManageAddressState {}

//Update
final class ManageAddressUpdateSuccess extends ManageAddressState {}

final class ManageAddressUpdateFailuer extends ManageAddressState {}

final class ManageAddressUpdateLoading extends ManageAddressState {}
