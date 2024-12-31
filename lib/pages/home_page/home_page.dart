import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/fetch_stores/fetch_stores_cubit.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/home_page/widgets/categories_list_view.dart';
import 'package:store/pages/home_page/widgets/home_favorites_button.dart';
import 'package:store/pages/home_page/widgets/home_search_field.dart';
import 'package:store/pages/home_page/widgets/shimmer_loading.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/pages/home_page/widgets/top_stores_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          const HomeSearchField(),
          const HomeFavoritesButton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          clipBehavior: Clip.none,
          children: [
            //categories row and see all
            TextRow(
              start: 'Categories',
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            //categories buttons row
            SizedBox(
              //avoid unlimited width error
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...List.generate(
                      7,
                      (index) {
                        return CategoriesListView(index: index);
                      },
                    )
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
            //top seling and see all
            TextRow(
              start: "Top Stores",
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            //Top Selling row
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: BlocConsumer<FetchStoresCubit, FetchStoresState>(
                listener: (context, state) {
                  if (state is FetchStoresFailure) {
                    errorDialog(context,
                        title: 'error',
                        message: state.errormessage,
                        contentType: ContentType.failure);
                  }
                },
                builder: (context, state) {
                  if (state is FetchStoresLoading) {
                    return const ShimmerLoading();
                  } else if (state is FetchStoresSuccess) {
                    return ListView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                          BlocProvider.of<FetchStoresCubit>(context)
                              .storesData
                              .length,
                          (index) {
                            return TopStoresListView(
                              index: index,
                              data: BlocProvider.of<FetchStoresCubit>(context)
                                  .storesData,
                            );
                          },
                        )
                      ],
                    );
                  } else {
                    BlocProvider.of<FetchStoresCubit>(context).getStores();
                    return const ShimmerLoading();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
