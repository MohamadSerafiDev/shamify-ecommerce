import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  List<bool> isfav = [];

  Future<void> toggleFavourite(
      {required final int index, required final int id}) async {
    dynamic response = await Api().post(
        url: '${Constants.localip}/api/v1/add-favorite/$id',
        withToken: true,
        body: {});

    if (response['isFavorite'] == false) {
      emit(FavouriteUnSelected());
    } else {
      emit(FavouriteSelected());
    }

    // fav api
    isfav[index] = !isfav[index];
  }
}
