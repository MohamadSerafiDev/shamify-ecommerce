// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/cubit/favourite_cubit.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/services/favorites/get_user_favorites.dart';
import 'package:store/styles/constants.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.darkbackgroundcolor,
          title: Text('Your Favorites'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: GetUserFavorites().getFav(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2.7 / 4),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    BlocProvider.of<FavouriteCubit>(context)
                        .isfav
                        .add(snapshot.data![index]['isFavorite']);
                    return ProductCard(
                      index: index,
                      data: snapshot.data![index],
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
