part of 'fetch_stores_cubit.dart';

@immutable
sealed class FetchStoresState {}

final class FetchStoresInitial extends FetchStoresState {}

final class FetchStoresLoading extends FetchStoresState {}

final class FetchStoresSuccess extends FetchStoresState {}

final class FetchStoresFailure extends FetchStoresState {
  final String errormessage;

  FetchStoresFailure({required this.errormessage});
}
