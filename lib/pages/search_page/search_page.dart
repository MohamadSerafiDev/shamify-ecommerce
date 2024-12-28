import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/pages/home_page/widgets/top_stores_list_view.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<SearchCubit>(context).search(query: Get.arguments);
      return null;
    });

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        Get.back();
        BlocProvider.of<FavouriteCubit>(context).isfav = [];
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: SizedBox(
            height: 50,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: Image.asset(
                  AppIcons.search,
                  color: Colors.white,
                  scale: 2.5,
                ),
                hintText: Get.arguments,
              ),
              onFieldSubmitted: (value) {
                //search backend
                BlocProvider.of<SearchCubit>(context).search(query: value);
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocConsumer<SearchCubit, SearchState>(
            listener: (context, state) {
              if (state is SearchFailure) {
                errorDialog(context,
                    title: 'Error',
                    message: state.errormessage,
                    contentType: ContentType.failure);
              }
            },
            builder: (context, state) {
              if (state is Searchloading) {
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: SpinKitDoubleBounce(
                        color: Constants.buttoncolor,
                        size: 100,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Loading ...', style: TextStyles.textStyle22),
                  ],
                );
              } else if (state is SearchSuccess) {
                //check cubit
                return ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('(${state.stores.length})'),
                        Flexible(
                            child:
                                TextRow(start: '  Stores', onPressed: () {})),
                      ],
                    ),
                    state.stores.isEmpty
                        ? const Center(
                            child: Text('No Stores Found'),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              itemCount: state.stores.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return TopStoresListView(
                                  index: index,
                                  data: state.stores,
                                );
                              },
                            ),
                          ),
                    //products results
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('(${state.products.length})'),
                        Flexible(
                          child: TextRow(start: '  Products', onPressed: () {}),
                        ),
                      ],
                    ),
                    state.products.isEmpty
                        ? const Center(
                            child: Text('No Products Found'),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: ListView.builder(
                              itemCount: state.products.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                BlocProvider.of<FavouriteCubit>(context)
                                    .isfav
                                    .add(state.products[index]['isFavorite']);
                                return SizedBox(
                                  width: 200,
                                  child: ProductCard(
                                      index: index,
                                      data: state.products[index]),
                                );
                              },
                            ),
                          ),
                  ],
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        AppImages.search,
                        width: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'No thing found',
                      style: TextStyles.textStyle22,
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
