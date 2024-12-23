import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/api/api.dart';
import 'package:store/shared_preferences/session_manage.dart';
import 'package:store/shared_preferences/token_manage.dart';
import 'package:store/styles/constants.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  List userData = [];

  Future<void> logInWithPhoneAndPassword(
      {required String phone, required String password}) async {
    //if you found the user in your database go
    try {
      emit(AuthLoading());
      dynamic data = await Api().post(
          url: '${Constants.localip}/api/v1/login',
          body: {'phone': phone, 'password': password},
          withToken: false);
      userData.addAll(data);
      await TokenManage().saveToken(data[0]['token']);
      await SessionManage().saveSessionId(data[0]['sessionId']);
      print(await TokenManage().getToken());
      print(await SessionManage().getSessionId());
      emit(AuthSuccess());
    } catch (e) {
      //if the user is not found or the password is wrong go to the error message
      emit(AuthFailure(errormessage: e.toString()));
    }
  }

  //signup
  Future<void> signUpWithEmailAndPassword(
      {required String phone,
      required String password,
      required String confirm,
      required String firstName,
      required String lastName}) async {
    try {
      emit(AuthLoading());
      dynamic data = await Api().post(
          url: '${Constants.localip}/api/v1/register',
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "location": "mazzeh",
            "phone": phone,
            "password": password
          },
          withToken: false);
      userData.addAll(data);
      await TokenManage().saveToken(data[0]['token']);
      await SessionManage().saveSessionId(data[0]['sessionId']);
      print(await TokenManage().getToken());
      print(await SessionManage().getSessionId());
      emit(AuthSuccess());
    } catch (e) {
      print(e);
      emit(AuthFailure(errormessage: e.toString()));
    }
  }
}
