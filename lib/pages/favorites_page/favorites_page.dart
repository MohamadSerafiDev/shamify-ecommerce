import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/fetch_favorites/fetch_favorites_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/global_widgets/grid_view_product_screen.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class FavoritesPage extends HookWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(
      () {
        BlocProvider.of<FetchFavoritesCubit>(context).getFav();
        return null;
      },
    );
    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Get.back();
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
      },
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: const SizedBox(
          width: 300,
          child: AddFavToCartFloatingButton(),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text('Your Favorites'),
        ),
        body: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 70),
            child: BlocConsumer<FetchFavoritesCubit, FetchFavoritesState>(
              listener: (context, state) {
                if (state is FetchFavoritesFailure) {
                  errorDialog(context,
                      title: 'Error',
                      message: state.errormessage,
                      contentType: ContentType.failure);
                }
              },
              builder: (context, state) {
                if (state is FetchFavoritesLoading) {
                  return const SpinKitThreeBounce(
                    color: Constants.buttoncolor,
                  );
                }
                if (state is FetchFavoritesSuccess) {
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

class AddFavToCartFloatingButton extends StatelessWidget {
  const AddFavToCartFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Constants.buttoncolor,
      onPressed: () async {
        dynamic response = await Api().post(
          url: '${Constants.localip}/api/v1/add-all-to-cart',
          withToken: true,
        );
        if (response['message'] == "good") {
          Get.snackbar(
            duration: const Duration(seconds: 1),
            'Success',
            'All favorites added to cart',
            backgroundColor: Theme.of(context).cardColor,
            snackPosition: SnackPosition.TOP,
          );
        }
      },
      child: Text(
        'add Favorites to your Cart +',
        style: TextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
