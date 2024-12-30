import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/models/search_model.dart';
import 'package:store/services/search/search_for_products_and_stores.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  Future<void> search({required String query}) async {
    try {
      emit(Searchloading());
      SearchModel results =
          await SearchForProductsAndStores().search(query: query);
      if (results.stores.isNotEmpty || results.products.isNotEmpty) {
        emit(SearchSuccess(stores: results.stores, products: results.products));
      } else {
        emit(SearchInitial());
      }
    } catch (e) {
      emit(SearchFailure(errormessage: e.toString()));
    }
  }
}
