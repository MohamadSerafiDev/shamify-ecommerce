part of 'fetch_category_cubit.dart';

@immutable
sealed class FetchCategoryState {}

final class FetchCategoryInitial extends FetchCategoryState {}

final class FetchCategoryLoading extends FetchCategoryState {}

final class FetchCategoryEmpty extends FetchCategoryState {}

final class FetchCategoryDeleted extends FetchCategoryState {}

final class FetchCategorySuccess extends FetchCategoryState {
  final dynamic products;
  FetchCategorySuccess({required this.products});
}

final class FetchCategoryFailure extends FetchCategoryState {
  final String errormessage;
  FetchCategoryFailure({required this.errormessage});
}
