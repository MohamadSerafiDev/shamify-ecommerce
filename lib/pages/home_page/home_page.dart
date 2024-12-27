import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store/cubits/fetch_stores/fetch_stores_cubit.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/pages/global_widgets/error_dialog.dart';
import 'package:store/pages/home_page/widgets/categories_list_view.dart';
import 'package:store/pages/home_page/widgets/shimmer_loading.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/pages/home_page/widgets/top_stores_list_view.dart';
import 'package:store/pages/search_page/search_page.dart';
import 'package:store/styles/assets.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  List<Map<String, dynamic>> cat = [
    {'name': 'shirts', 'icon': Icons.numbers},
    {'name': 'T-shirts', 'icon': Icons.numbers},
    {'name': 'Hoodies', 'icon': Icons.numbers},
    {'name': 'Bags', 'icon': Icons.numbers},
    {'name': 'Shoes', 'icon': Icons.numbers},
    {'name': 'Accessories', 'icon': Icons.numbers},
    {'name': 'Gloves', 'icon': Icons.numbers},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.68,
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
                    hintText: "Search",
                  ),
                  onFieldSubmitted: (value) {
                    //search backend
                    Get.to(const SearchPage(), arguments: value);
                    print(value);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        // navigation to fav
                        Get.to(const FavoritesPage());
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: Image.asset(
                        AppIcons.isfav,
                        width: 25,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: ListView(
              // clipBehavior: Clip.none,
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
                            return CategoriesListView(cat: cat, index: index);
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
                                  data:
                                      BlocProvider.of<FetchStoresCubit>(context)
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
        ],
      ),
    );
  }
}

// FutureBuilder(
//               future: GetAllStores().getStores(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView(
//                     clipBehavior: Clip.none,
//                     scrollDirection: Axis.horizontal,
//                     children: [
//                       ...List.generate(
//                         snapshot.data!.length,
//                         (index) {
//                           return TopStoresListView(
//                             index: index,
//                             data: snapshot.data,
//                           );
//                         },
//                       )
//                     ],
//                   );
//                 } else {
//                   return ShimmerLoading();
//                 }
//               },
//             ),
