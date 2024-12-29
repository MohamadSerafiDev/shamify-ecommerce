import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/products_page/products_page.dart';
import 'package:store/styles/assets.dart';

class TopStoresListView extends StatelessWidget {
  TopStoresListView({super.key, required this.index, required this.data});
  final List<bool> isfav = List.generate(20, (index) => false);
  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(left: 0)
          : const EdgeInsets.only(left: 12),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Get.to(
              ProductsPage(
                title: data[index]['name'],
              ),
              arguments: index);
        },
        child: Card(
          color: Theme.of(context).cardColor,
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
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  // Positioned(
                  //   top: 5,
                  //   right: 5,
                  //   child: BlocBuilder<FavouriteCubit, FavouriteState>(
                  //     builder: (context, state) {
                  //       return IconButton(
                  //         icon: Image.asset(
                  //           BlocProvider.of<FavouriteCubit>(context)
                  //                   .isfav[index]
                  //               ? AppIcons.isfav
                  //               : AppIcons.notfav,
                  //           width: 28,
                  //           color: BlocProvider.of<FavouriteCubit>(context)
                  //                   .isfav[index]
                  //               ? Colors.red
                  //               : Colors.white,
                  //         ),
                  //         onPressed: () {
                  //           BlocProvider.of<FavouriteCubit>(context)
                  //               .toggleFavourite(index);
                  //         },
                  //       );
                  //     },
                  //   ),
                  // ),
                  Positioned(
                    top: 70,
                    left: 25,
                    child: Image.asset(AppIcons.truesing),
                    // child: Image.network(
                    //   '${Constants.localip}${data[index]['photoURL']}',
                    //   width: 150,
                    // ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  data[index]['name'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  data[index]['name'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
