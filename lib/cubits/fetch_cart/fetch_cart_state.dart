part of 'fetch_cart_cubit.dart';

@immutable
sealed class FetchCartState {}

final class FetchCartInitial extends FetchCartState {}

final class FetchCartLoading extends FetchCartState {}

final class FetchCartSuccess extends FetchCartState {
  final CartModel cart;
  FetchCartSuccess({required this.cart});
}

final class FetchCartFailure extends FetchCartState {
  final String errormessage;
  FetchCartFailure({required this.errormessage});
}
