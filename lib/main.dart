// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/componants/home_page/home_page.dart';
import 'package:store/componants/auth/auth_cubit/log_in/login_cubit.dart';
import 'package:store/componants/auth/auth_cubit/signup/cubit/signup_cubit.dart';
import 'package:store/componants/auth/auth_page.dart';
import 'package:store/styles/themes.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => SignUpCubit()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final bool isdark = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: isdark ? Themes().dark : Themes().light,
      home: Scaffold(
        extendBody: true,
        body: AuthPage(),
      ),
    );
  }
}
