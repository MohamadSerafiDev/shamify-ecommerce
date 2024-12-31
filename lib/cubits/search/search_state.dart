part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class Searchloading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List stores;
  final List<ProductModel> products;

  SearchSuccess({required this.stores, required this.products});
}

final class SearchFailure extends SearchState {
  final String errormessage;

  SearchFailure({required this.errormessage});
}
