import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/favorites/get_user_favorites.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

part 'fetch_favorites_state.dart';

class FetchFavoritesCubit extends Cubit<FetchFavoritesState> {
  FetchFavoritesCubit() : super(FetchFavoritesInitial());

  List<ProductModel>? productsData;

  Future<void> getFav() async {
    try {
      emit(FetchFavoritesLoading());
      productsData = await GetUserFavorites().getFav();
      emit(FetchFavoritesSuccess(productData: productsData!));
    } catch (e) {
      emit(FetchFavoritesFailure(errormessage: e.toString()));
    }
  }
}
