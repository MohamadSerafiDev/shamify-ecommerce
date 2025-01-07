import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/home_page/main_home_page.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> checkToken() async {
      BlocProvider.of<TokenManageCubit>(context).checkToken();
    }

    return BlocBuilder<TokenManageCubit, TokenManageState>(
      builder: (context, state) {
        checkToken();
        if (state is TokenManageNoToken) {
          return const AuthPage();
        } else if (state is TokenManageWithToken) {
          return const MainHomePage();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
