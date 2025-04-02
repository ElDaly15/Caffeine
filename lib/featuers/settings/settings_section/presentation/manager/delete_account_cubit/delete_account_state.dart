part of 'delete_account_cubit.dart';

@immutable
sealed class DeleteAccountState {}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoading extends DeleteAccountState {}

final class DeleteAccountSuccess extends DeleteAccountState {}

final class DeleteAccountFailuer extends DeleteAccountState {
  final String errorMsg;

  DeleteAccountFailuer({required this.errorMsg});
}
