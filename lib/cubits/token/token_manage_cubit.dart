import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/home_page/main_home_page.dart';
import 'package:store/shared_preferences/token_manage.dart';

part 'token_manage_state.dart';

class TokenManageCubit extends Cubit<TokenManageState> {
  TokenManageCubit() : super(TokenManageInitial());

  Future<dynamic> checkToken() async {
    String? token = await TokenManage().getToken();
    if (token == null) {
      emit(TokenManageNoToken());
    } else {
      // print(storesData);
      emit(TokenManageWithToken());
    }
  }

  void removedToken() async {
    await TokenManage().removeToken();
    await checkToken();
  }

  dynamic getPage() {
    if (state is TokenManageWithToken) {
      return MainHomePage();
    } else {
      return const AuthPage();
    }
  }
}
