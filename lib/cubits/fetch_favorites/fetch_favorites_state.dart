part of 'fetch_favorites_cubit.dart';

@immutable
sealed class FetchFavoritesState {}

final class FetchFavoritesInitial extends FetchFavoritesState {}

final class FetchFavoritesLoading extends FetchFavoritesState {}

final class FetchFavoritesSuccess extends FetchFavoritesState {
  final List<ProductModel> productData;

  FetchFavoritesSuccess({required this.productData});
}

final class FetchFavoritesFailure extends FetchFavoritesState {
  final String errormessage;

  FetchFavoritesFailure({required this.errormessage});
}
