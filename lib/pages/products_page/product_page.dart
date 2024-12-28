// ignore_for_file: prefer_const_constructors

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/fetch_store_products/fetch_store_products_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/styles/constants.dart';

class ProductPage extends HookWidget {
  const ProductPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        BlocProvider.of<FetchStoreProductsCubit>(context)
            .getProducts(storeId: Get.arguments + 1);
        return null;
      },
    );
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
            child:
                BlocConsumer<FetchStoreProductsCubit, FetchStoreProductsState>(
              listener: (context, state) {
                if (state is FetchStoreProductsFailure) {
                  errorDialog(context,
                      title: 'Error',
                      message: state.errormessage,
                      contentType: ContentType.failure);
                }
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is FetchStoreProductsLoading) {
                  return CircularProgressIndicator();
                }
                if (state is FetchStoreProductsSuccess) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 2.6 / 4),
                    itemCount: BlocProvider.of<FetchStoreProductsCubit>(context)
                        .productsData
                        .length,
                    itemBuilder: (context, index) {
                      BlocProvider.of<FavouriteCubit>(context).isfav.add(
                          BlocProvider.of<FetchStoreProductsCubit>(context)
                              .productsData[index]['isFavorite']);
                      return ProductCard(
                        index: index,
                        data: BlocProvider.of<FetchStoreProductsCubit>(context)
                            .productsData[index],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: Text('data'),
                  );
                }
              },
            )),
      ),
    );
  }
}


// FutureBuilder(
//             future: GetSpecificStoreProducts()
//                 .getStoreWithProducts(id: Get.arguments + 1),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, childAspectRatio: 2.7 / 4),
//                   itemCount: snapshot.data!.length,
//                   itemBuilder: (context, index) {
//                     BlocProvider.of<FavouriteCubit>(context)
//                         .isfav
//                         .add(snapshot.data![index]['isFavorite']);
//                     return ProductCard(
//                       index: index,
//                       data: snapshot.data![index],
//                     );
//                   },
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
