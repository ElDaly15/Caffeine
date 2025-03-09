part of 'manage_favourite_products_cubit.dart';

@immutable
sealed class ManageFavouriteProductsState {}

final class ManageFavouriteProductsInitial
    extends ManageFavouriteProductsState {}

final class ManageFavouriteProductsSuccess
    extends ManageFavouriteProductsState {}

final class ManageFavouriteProductsFailuer
    extends ManageFavouriteProductsState {}

final class ManageFavouriteProductsLoading
    extends ManageFavouriteProductsState {}
