part of 'profile_image_cubit.dart';

@immutable
sealed class ProfileImageState {}

final class ProfileImageInitial extends ProfileImageState {}

final class ProfileImageUpdated extends ProfileImageState {}
