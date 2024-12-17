// ignore_for_file: missing_required_param

import 'package:bloc/bloc.dart';
import 'package:store/api/api.dart';
import 'package:store/shared_preferences/token_manage.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logInWithPhoneAndPassword(
      {required String phone, required String password}) async {
    //if you found the user in your database go
    try {
      emit(LoginLoading());
      dynamic data = await Api().post(
          url: 'http://26.46.185.74:8000/api/v1/login',
          body: {'phone': phone, 'password': password});
      await TokenManage().saveToken(data[0]['token']);
      print(await TokenManage().getToken());
      emit(LoginSuccess());
    } catch (e) {
      //if the user is not found or the password is wrong go to the error message
      emit(LoginFailure(errormessage: e.toString()));
    }
  }
}
