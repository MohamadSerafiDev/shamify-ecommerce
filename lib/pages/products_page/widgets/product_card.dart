import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
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
        // Get.to(const ProductPage(), arguments: index);
      },
      child: Card(
        color: Constants.darkinsidecolor,
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
                    color: Constants.darkinsidecolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                        onPressed: () {
                          BlocProvider.of<FavouriteCubit>(context)
                              .toggleFavourite(index: index, id: data['id']);
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 25,
                  child: Image.asset(
                    AppImages.bell,
                    width: 150,
                  ),
                )
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
                        data['id'].toString(),
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () async {
                            await Api().post(
                                url:
                                    '${Constants.localip}/api/v1/add-to-cart/${data['id'].toString()}',
                                body: {'quantity': "1"},
                                withToken: true);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart_outlined,
                            size: 30,
                            color: Constants.buttoncolor,
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
