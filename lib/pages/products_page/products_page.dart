import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/fetch_store_products/fetch_store_products_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/global_widgets/grid_view_product_screen.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/styles/constants.dart';

class ProductsPage extends HookWidget {
  const ProductsPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        print('===============${Get.arguments}');
        BlocProvider.of<FetchStoreProductsCubit>(context)
            .getProducts(storeId: Get.arguments);
        return null;
      },
    );
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
              },
              builder: (context, state) {
                if (state is FetchStoreProductsLoading) {
                  return const SpinKitThreeBounce(
                    color: Constants.buttoncolor,
                  );
                }
                if (state is FetchStoreProductsSuccess) {
                  return GridViewProductScreen(data: state.productData);
                } else {
                  return const Center(
                    child: Text('data'),
                  );
                }
              },
            )),
      ),
    );
  }
}
