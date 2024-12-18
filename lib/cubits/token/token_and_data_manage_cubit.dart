// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/home_page/main_home_page.dart';
import 'package:store/services/stores/get_all_stores.dart';
import 'package:store/shared_preferences/token_manage.dart';

part 'token_and_data_manage_state.dart';

class TokenAndDataManageCubit extends Cubit<TokenAndDataManageState> {
  TokenAndDataManageCubit() : super(TokenManageInitial());
  dynamic storesData;
  Future<dynamic> setData() async {
    storesData = await GetAllStores().getStores();
    return storesData;
  }

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
      return AuthPage();
    }
  }
}
