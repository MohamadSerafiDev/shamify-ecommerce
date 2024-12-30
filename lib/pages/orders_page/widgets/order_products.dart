import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({super.key, required this.title, required this.data});
  final String title;
  final List data;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Get.back();
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(title),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.6 / 4,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: data.length,
            itemBuilder: (context, index) {
              BlocProvider.of<FavouriteCubit>(context)
                  .isfav
                  .add(data[index]['product']['isFavorite']);
              return ProductCard(
                index: index,
                data: data[index]['product'],
              );
            },
          ),
        ),
      ),
    );
  }
}
