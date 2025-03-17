part of 'check_copoun_cubit.dart';

@immutable
sealed class CheckCopounState {}

final class CheckCopounInitial extends CheckCopounState {}

final class CheckCopounSuccess extends CheckCopounState {
  final CouponModel couponModel;

  CheckCopounSuccess({required this.couponModel});
}

final class CheckCopounLoading extends CheckCopounState {}

final class CheckCopounFailuer extends CheckCopounState {
  final String msg;

  CheckCopounFailuer({required this.msg});
}
