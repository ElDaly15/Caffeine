part of 'login_user_cubit.dart';

@immutable
sealed class LoginUserState {}

final class LoginUserInitial extends LoginUserState {}

final class LoginUserLoading extends LoginUserState {}

final class LoginUserSuccess extends LoginUserState {
  final UserEntity userEntity;

  LoginUserSuccess({required this.userEntity});
}

final class LoginUserFailuer extends LoginUserState {
  final String message;

  LoginUserFailuer({required this.message});
}
