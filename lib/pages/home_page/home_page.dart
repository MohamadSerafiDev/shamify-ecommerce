// ignore_for_file:  prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/favourite/cubit/favourite_cubit.dart';
import 'package:store/pages/home_page/widgets/app_bar_componants.dart';
import 'package:store/pages/home_page/widgets/categories_list_view.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  int index = 0;
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
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        //top search
        appBar: AppBarComponants(
          searchcontroller: searchcontroller,
        ),
        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: index,
          items: [
            CrystalNavigationBarItem(
                icon: Icons.home, selectedColor: Colors.blue),
            CrystalNavigationBarItem(
                icon: Icons.favorite, selectedColor: Colors.red),
          ],
          backgroundColor: Colors.grey.withOpacity(0.1),
          enableFloatingNavBar: true,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.3),
                blurStyle: BlurStyle.inner,
                offset: const Offset(0, 2)),
          ],
          duration: const Duration(seconds: 2),
          enablePaddingAnimation: true,
          paddingR: const EdgeInsets.symmetric(horizontal: 10),
          onTap: (selected) {
            setState(() {
              index = selected;
            });
          },
        ),
        body: ListView(
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
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 15),
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
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 15),
                children: [
                  ...List.generate(
                    10,
                    (index) {
                      return TopStoresListView(
                        index: index,
                      );
                    },
                  )
                ],
              ),
            ),
            const Text('hihihihi')
          ],
        ),
      ),
    );
  }
}

class TopStoresListView extends StatefulWidget {
  TopStoresListView({super.key, required this.index});
  final List<bool> isfav = List.generate(20, (index) => false);
  final int index;

  @override
  State<TopStoresListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<TopStoresListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
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
                          BlocProvider.of<FavouriteCubit>(context)
                                  .isfav[widget.index]
                              ? AppIcons.isfav
                              : AppIcons.notfav,
                          width: 28,
                          color: BlocProvider.of<FavouriteCubit>(context)
                                  .isfav[widget.index]
                              ? Colors.red
                              : Colors.white,
                        ),
                        onPressed: () {
                          BlocProvider.of<FavouriteCubit>(context)
                              .toggleFavourite(widget.index);
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
