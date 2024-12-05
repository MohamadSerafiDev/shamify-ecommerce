part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteSelected extends FavouriteState {}

final class FavouriteUnSelected extends FavouriteState {}
