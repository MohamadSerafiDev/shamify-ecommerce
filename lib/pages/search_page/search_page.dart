import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/cubits/search/search_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/pages/home_page/widgets/top_stores_list_view.dart';
import 'package:store/pages/store_products_page/widgets/product_card.dart';
import 'package:store/pages/search_page/widgets/no_results_found.dart';
import 'package:store/pages/search_page/widgets/search_field.dart';
import 'package:store/pages/search_page/widgets/search_loading_double_bounce.dart';

class SearchPage extends HookWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      BlocProvider.of<SearchCubit>(context).search(query: Get.arguments);
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const SearchField(),
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
              return const SearchLoadingDoubleBounce();
            } else if (state is SearchSuccess) {
              //check cubit
              return ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('(${state.stores.length})'),
                      Flexible(
                          child: TextRow(start: '  Stores', onPressed: () {})),
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
                        child: TextRow(
                          start: '  Products',
                          onPressed: () {},
                        ),
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
                              return SizedBox(
                                width: 200,
                                child: ProductCard(
                                    index: index, data: state.products[index]),
                              );
                            },
                          ),
                        ),
                ],
              );
            } else {
              return const NoResultsFound();
            }
          },
        ),
      ),
    );
  }
}
