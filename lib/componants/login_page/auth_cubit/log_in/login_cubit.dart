import 'package:bloc/bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> logInWithPhoneAndPassword(String phone, String password) async {
    try {
      emit(LoginLoading());
      if (phone == 'admin' && password == 'admin') {
        Future.delayed(const Duration(seconds: 2), () {
          emit(LoginSuccess());
        });
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}
