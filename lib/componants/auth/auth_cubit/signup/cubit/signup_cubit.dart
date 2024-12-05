import 'package:bloc/bloc.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpWithEmailAndPassword(
      {required String phone,
      required String password,
      required String confirm,
      required String firstName,
      required String lastName}) async {
    try {
      emit(SignUpLoading());
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
