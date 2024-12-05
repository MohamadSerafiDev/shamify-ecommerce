import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/favourite/cubit/favourite_cubit.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class TopStoresListView extends StatelessWidget {
  TopStoresListView({super.key, required this.index});
  final List<bool> isfav = List.generate(20, (index) => false);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Card(
        color: Constants.darkinsidecolor,
        //product stack
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
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
                              .toggleFavourite(index);
                        },
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 25,
                  child: Image.asset(
                    AppImages.bell,
                    width: 150,
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Product Name',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Product Price *',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
