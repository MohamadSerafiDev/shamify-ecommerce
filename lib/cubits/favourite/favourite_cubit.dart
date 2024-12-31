import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  Future<String> toggleFavourite({required final int id}) async {
    dynamic response = await Api().post(
        url: '${Constants.localip}/api/v1/add-favorite/$id',
        withToken: true,
        body: null);

    emit(
      FavouriteUpdated(),
    );
    return response['message'];
    // fav api
  }
}
