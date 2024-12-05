import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
  final List<bool> isfav = List.generate(20, (index) => false);

  void toggleFavourite(int index) {
    if (isfav[index] == false) {
      emit(FavouriteUnSelected());
    } else {
      emit(FavouriteSelected());
    }
    isfav[index] = !isfav[index];
  }
}
