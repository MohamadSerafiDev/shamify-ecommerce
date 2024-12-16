part of 'shared_preferences_cubit.dart';

@immutable
sealed class SharedPreferencesState {}

final class SharedPreferencesInitial extends SharedPreferencesState {}

final class SharedPreferencesNoToken extends SharedPreferencesState {}

final class SharedPreferencesWithToken extends SharedPreferencesState {}
