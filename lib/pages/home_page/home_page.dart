import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/pages/home_page/widgets/app_bar_componants.dart';
import 'package:store/pages/home_page/widgets/categories_list_view.dart';
import 'package:store/pages/home_page/widgets/text_row.dart';
import 'package:store/pages/home_page/widgets/top_stores_list_view.dart';

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
        extendBody: true,
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
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
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
            ],
          ),
        ),
      ),
    );
  }
}
