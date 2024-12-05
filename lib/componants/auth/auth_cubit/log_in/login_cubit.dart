import 'package:bloc/bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logInWithPhoneAndPassword(
      {required String phone, required String password}) async {
    try {
      emit(LoginLoading());
      //if you found the user in your database go
      if (phone == 'admin' && password == 'admin') {
        await Future.delayed(const Duration(seconds: 1), () {});
        emit(LoginSuccess());
      }
      //if the user is not found or the password is wrong go to the error message
      else {
        emit(LoginFailure(
            errormessage:
                'The phone number or password you entered is incorrect.'));
      }
    } catch (e) {
      emit(LoginFailure(errormessage: e.toString()));
    }
  }
}
