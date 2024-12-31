part of 'fetch_store_products_cubit.dart';

@immutable
sealed class FetchStoreProductsState {}

final class FetchStoreProductsInitial extends FetchStoreProductsState {}

final class FetchStoreProductsLoading extends FetchStoreProductsState {}

final class FetchStoreProductsSuccess extends FetchStoreProductsState {
  final List<ProductModel> productData;

  FetchStoreProductsSuccess({required this.productData});
}

final class FetchStoreProductsFailure extends FetchStoreProductsState {
  final String errormessage;

  FetchStoreProductsFailure({required this.errormessage});
}
