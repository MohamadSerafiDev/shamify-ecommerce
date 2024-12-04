import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      emit(SignUpLoading());
      emit(SignUpSuccess());
    } catch (e) {
      emit(SignUpFailure(error: e.toString()));
    }
  }
}
