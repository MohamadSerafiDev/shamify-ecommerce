import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/auth/auth_cubit.dart';
import 'package:store/cubits/counter/counter_cubit.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/cubits/fetch_store_products/fetch_store_products_cubit.dart';
import 'package:store/cubits/fetch_stores/fetch_stores_cubit.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/cubits/theme/theme_cubit.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/auth_page/auth_page.dart';
import 'package:store/pages/home_page/main_home_page.dart';
import 'package:store/styles/themes.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context) => FavouriteCubit()),
      BlocProvider(create: (context) => NavigationBarCubit()),
      BlocProvider(create: (context) => ProfileImageCubit()),
      BlocProvider(create: (context) => TokenManageCubit()),
      BlocProvider(create: (context) => FetchStoresCubit()),
      BlocProvider(create: (context) => FetchStoreProductsCubit()),
      BlocProvider(create: (context) => SearchCubit()),
      BlocProvider(create: (context) => FetchCartCubit()),
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => ThemeCubit()),
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
    Future<void> checkToken() async {
      BlocProvider.of<TokenManageCubit>(context).checkToken();
    }

    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        if (state is ThemeDark) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Themes().light,
              home: BlocBuilder<TokenManageCubit, TokenManageState>(
                builder: (context, state) {
                  checkToken();
                  if (state is TokenManageNoToken) {
                    return const AuthPage();
                  } else {
                    return MainHomePage();
                  }
                },
              ));
        } else {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: Themes().dark,
              home: BlocBuilder<TokenManageCubit, TokenManageState>(
                builder: (context, state) {
                  checkToken();
                  if (state is TokenManageNoToken) {
                    return const AuthPage();
                  } else {
                    return MainHomePage();
                  }
                },
              ));
        }
      },
    );
  }
}
