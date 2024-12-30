// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/product_page/product_page.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.index, required this.data});
  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        // Get.to(const ProductPage(title: '',), arguments: index);
        Get.to(ProductPage());
      },
      child: Card(
        color: Theme.of(context).cardColor,
        //product stack
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Center(
                  child: Image.asset(AppImages.parcel),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      return IconButton(
                        icon: Image.asset(
                          BlocProvider.of<FavouriteCubit>(context).isfav[index]
                              ? AppIcons.isfav
                              : AppIcons.notfav,
                          width: 28,
                          color: BlocProvider.of<FavouriteCubit>(context)
                                  .isfav[index]
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () async {
                          await BlocProvider.of<FavouriteCubit>(context)
                              .toggleFavourite(index: index, id: data['id']);
                          Get.snackbar(
                            duration: const Duration(milliseconds: 1500),
                            'Success',
                            'Added to favorites ❤️',
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['name'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '${data['price']} \$',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              if (data['count'] > 0) {
                                await Api().post(
                                    url:
                                        '${Constants.localip}/api/v1/add-to-cart/${data['id'].toString()}',
                                    body: jsonEncode({'quantity': '1'}),
                                    withToken: true);
                                // create snackbar
                                Get.snackbar(
                                  duration: const Duration(milliseconds: 1500),
                                  'Success',
                                  'Added to cart',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              } else {
                                Get.snackbar(
                                  duration: const Duration(milliseconds: 1500),
                                  'Failed',
                                  'Not enoug products in stock',
                                  snackPosition: SnackPosition.BOTTOM,
                                );
                              }
                            },
                            icon: const Icon(
                              Icons.add_shopping_cart_outlined,
                              size: 30,
                              color: Constants.buttoncolor,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('in storage:'),
                      const Spacer(),
                      Text(
                        '${data['count']}',
                        style: TextStyle(
                            color:
                                data['count'] < 4 ? Colors.red : Colors.green),
                      ),
                      const SizedBox(
                        width: 17,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
