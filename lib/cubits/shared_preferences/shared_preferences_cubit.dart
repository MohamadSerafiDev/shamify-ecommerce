import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/shared_preferences/TokenManage.dart';

part 'shared_preferences_state.dart';

class SharedPreferencesCubit extends Cubit<SharedPreferencesState> {
  SharedPreferencesCubit() : super(SharedPreferencesInitial());
  Future<dynamic> getToken() async {
    String? token = await Tokenmanage().getToken();
    if (token == null) {
      emit(SharedPreferencesNoToken());
    } else {
      emit(SharedPreferencesWithToken());
    }
  }
}
