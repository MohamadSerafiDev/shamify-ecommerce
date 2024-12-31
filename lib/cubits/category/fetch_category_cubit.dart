import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/category/get_category.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

part 'fetch_category_state.dart';

class FetchCategoryCubit extends Cubit<FetchCategoryState> {
  FetchCategoryCubit() : super(FetchCategoryInitial());

  Future<void> getCategories(int? id, {required String category}) async {
    try {
      emit(FetchCategoryLoading());
      List<ProductModel> categories = await GetCategory().getCat(category);
      if (categories.isEmpty || categories.length == 1) {
        emit(FetchCategoryInitial());
      } else {
        if (id != null) {
          categories.removeWhere((element) => element.id == id);
        }
        emit(FetchCategorySuccess(products: categories));
      }
    } catch (e) {
      emit(FetchCategoryFailure(errormessage: e.toString()));
    }
  }
}
