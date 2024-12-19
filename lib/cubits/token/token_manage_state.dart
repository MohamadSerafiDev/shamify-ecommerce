part of 'token_manage_cubit.dart';

@immutable
sealed class TokenManageState {}

final class TokenManageInitial extends TokenManageState {}

final class TokenManageNoToken extends TokenManageState {}

final class TokenManageWithToken extends TokenManageState {}
