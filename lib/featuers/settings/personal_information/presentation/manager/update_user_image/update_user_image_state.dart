part of 'update_user_image_cubit.dart';

@immutable
sealed class UpdateUserImageState {}

final class UpdateUserImageInitial extends UpdateUserImageState {}

final class UpdateUserImageSuccess extends UpdateUserImageState {}

final class UpdateUserImageFailuer extends UpdateUserImageState {}

final class UpdateUserImageLoading extends UpdateUserImageState {}
