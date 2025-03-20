import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/auth/auth_cubit.dart';
import 'package:store/cubits/category/fetch_category_cubit.dart';
import 'package:store/cubits/counter/counter_cubit.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/cubits/fetch_favorites/fetch_favorites_cubit.dart';
import 'package:store/cubits/fetch_store_products/fetch_store_products_cubit.dart';
import 'package:store/cubits/fetch_stores/fetch_stores_cubit.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/cubits/profile_image/profile_image_cubit.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/cubits/token/token_manage_cubit.dart';
import 'package:store/pages/revealing%20nft/nft_reveal.dart';
import 'package:store/pages/splash_view/splash_screen.dart';
import 'package:store/styles/themes.dart';

//

void main() async {
  //initialize firebase here
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String? messaging = await FirebaseMessaging.instance.getToken();

  for (var i = 2000; i < 2500; i++) {
    dynamic res = await Api().get(
        url:
            'https://ipfs.io/ipfs/bafybeie4xm6bkcedb2zotcsjbggiykcu77tur73jbpeq2x2qzhvt47bbja/$i/');
    res['attributes'][0]['value'] == res['attributes'][1]['value']
        ? print('${res['name']} : : : ${res['attributes'][0]} ')
        : print('${res['name']}=====================');
  }

  print("FCM Token: $messaging");
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => AuthCubit()),
      BlocProvider(create: (context) => FavouriteCubit()),
      BlocProvider(create: (context) => NavigationBarCubit()),
      BlocProvider(create: (context) => ProfileImageCubit()),
      BlocProvider(create: (context) => TokenManageCubit()),
      BlocProvider(create: (context) => FetchStoresCubit()),
      BlocProvider(create: (context) => FetchStoreProductsCubit()),
      BlocProvider(create: (context) => FetchFavoritesCubit()),
      BlocProvider(create: (context) => FetchCategoryCubit()),
      BlocProvider(create: (context) => SearchCubit()),
      BlocProvider(create: (context) => FetchCartCubit()),
      BlocProvider(create: (context) => CounterCubit()),
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
    return ThemeProvider(
        initTheme: Themes().dark,
        builder: (context, myTheme) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: myTheme,
            home: NftReveal(),
          );
        });
  }
}
