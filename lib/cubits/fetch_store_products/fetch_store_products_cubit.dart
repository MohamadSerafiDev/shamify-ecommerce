import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

part 'fetch_store_products_state.dart';

class FetchStoreProductsCubit extends Cubit<FetchStoreProductsState> {
  FetchStoreProductsCubit() : super(FetchStoreProductsInitial());
  List<ProductModel>? productsData;

  Future<void> getProducts({required int storeId}) async {
    try {
      emit(FetchStoreProductsLoading());
      productsData =
          await GetSpecificStoreProducts().getStoreWithProducts(id: storeId);
      emit(FetchStoreProductsSuccess(productData: productsData!));
    } catch (e) {
      emit(FetchStoreProductsFailure(errormessage: e.toString()));
    }
  }
}
