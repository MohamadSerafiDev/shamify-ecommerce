part of 'token_and_data_manage_cubit.dart';

@immutable
sealed class TokenAndDataManageState {}

final class TokenManageInitial extends TokenAndDataManageState {}

final class TokenManageNoToken extends TokenAndDataManageState {}

final class TokenManageWithToken extends TokenAndDataManageState {}
