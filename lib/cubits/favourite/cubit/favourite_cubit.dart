import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  List<bool> isfav = List.generate(20, (index) => false, growable: true);

  Future<void> toggleFavourite(int index) async {
    dynamic response = await Api().post(
        url: '${Constants.localip}/api/v1/add-favorite/${index + 1}',
        withToken: true,
        body: {});
    print(response);
    if (response['isFavorite'] == false) {
      print(isfav[index]);
      emit(FavouriteUnSelected());
    } else {
      print(isfav[index]);
      emit(FavouriteSelected());
    }

    // fav api
    isfav[index] = !isfav[index];
  }
}
