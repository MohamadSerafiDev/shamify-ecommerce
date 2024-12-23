import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/services/stores/get_all_stores.dart';

part 'fetch_stores_state.dart';

class FetchStoresCubit extends Cubit<FetchStoresState> {
  FetchStoresCubit() : super(FetchStoresInitial());
  dynamic storesData;

  Future<void> getStores() async {
    try {
      emit(FetchStoresLoading());
      storesData = await GetAllStores().getStores();
      emit(FetchStoresSuccess());
    } catch (e) {
      emit(FetchStoresFailure(errormessage: e.toString()));
    }
  }
}
