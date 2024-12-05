import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/cubit/favourite_cubit.dart';
import 'package:store/cubits/log_in/login_cubit.dart';
import 'package:store/cubits/signup/signup_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/home_page/home_page.dart';
import 'package:store/styles/themes.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => LoginCubit()),
      BlocProvider(create: (context) => SignUpCubit()),
      BlocProvider(create: (context) => FavouriteCubit()),
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: isdark ? Themes().dark : Themes().light,
      home: const Scaffold(
        extendBody: true,
        body: HomePage(),
      ),
    );
  }
}
