part of 'magnage_rating_cubit.dart';

@immutable
sealed class MagnageRatingState {}

final class MagnageRatingInitial extends MagnageRatingState {}

final class MagnageRatingLoading extends MagnageRatingState {}

final class MagnageRatingSuccess extends MagnageRatingState {}

final class MagnageRatingFailuer extends MagnageRatingState {}
