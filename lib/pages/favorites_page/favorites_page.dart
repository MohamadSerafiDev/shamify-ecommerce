import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/services/favorites/get_user_favorites.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          width: 300,
          child: FloatingActionButton(
            backgroundColor: Constants.buttoncolor,
            onPressed: () async {
              dynamic response = await Api().post(
                url: '${Constants.localip}/api/v1/add-all-to-cart',
                withToken: true,
              );
              print(response);
            },
            child: Text(
              'add Favorites to your Cart +',
              style:
                  TextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text('Your Favorites'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 70),
          child: FutureBuilder(
            future: GetUserFavorites().getFav(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data!.isEmpty) {
                  return const Center(
                      child: Text('No products in your favorites'));
                } else {
                  return GridView.builder(
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2.5 / 4,
                    ),
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
                }
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
