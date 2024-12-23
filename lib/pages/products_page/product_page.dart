// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Get.back();
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.darkbackgroundcolor,
          title: Text("$title Products"),
          // clipBehavior: Clip.none,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: FutureBuilder(
            future: GetSpecificStoreProducts()
                .getStoreWithProducts(id: Get.arguments + 1),
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
