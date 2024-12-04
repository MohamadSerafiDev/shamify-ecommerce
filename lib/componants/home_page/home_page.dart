// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List<Map<String, dynamic>> cat = [
    {'name': 'one', 'icon': Icons.numbers},
    {'name': 'two', 'icon': Icons.numbers},
    {'name': 'three', 'icon': Icons.numbers},
    {'name': 'four', 'icon': Icons.numbers},
    {'name': 'five', 'icon': Icons.numbers},
    {'name': 'six', 'icon': Icons.numbers},
    {'name': 'seven', 'icon': Icons.numbers},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 20),
      child: Scaffold(
        //top search
        appBar: appBarComponants(),
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
                offset: Offset(0, 2)),
          ],
          duration: Duration(seconds: 2),
          enablePaddingAnimation: true,
          paddingR: EdgeInsets.symmetric(horizontal: 10),
          onTap: (selected) {
            setState(() {
              index = selected;
            });
          },
        ),
        body: ListView(
          children: [
            //categories row and see all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("See All",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //categories buttons row
            SizedBox(
              //avoid unlimited width error
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15),
                  children: [
                    ...List.generate(
                      7,
                      (index) {
                        return CategoriesListView(cat: cat, index: index);
                      },
                    )
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            //top seling and see all
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Selling",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "See All >>",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //Top Selling row
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                children: [
                  ...List.generate(
                    10,
                    (index) {
                      return topSellingListView(
                        index: index,
                      );
                    },
                  )
                ],
              ),
            ),
            Text('hihihihi')
          ],
        ),
      ),
    );
  }

  AppBar appBarComponants() {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: "Search",
            ),
            onFieldSubmitted: (value) {
              //search backend
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    // navigation to cart
                  },
                  child: Image.asset(
                    AppIcons.cart,
                    width: 20,
                    height: 20,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    minimumSize: Size(50, 50),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.cat,
    required this.index,
  });

  final List<Map<String, dynamic>> cat;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              //categories navigation
            },
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(50)),
              child: Center(child: Icon(cat[index]['icon'])),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(cat[index]['name'])
        ],
      ),
    );
  }
}

class topSellingListView extends StatefulWidget {
  topSellingListView({super.key, required this.index});
  List<bool> isfav = List.generate(20, (index) => false);
  final int index;

  @override
  State<topSellingListView> createState() => _ProductsListViewState();
}

class _ProductsListViewState extends State<topSellingListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        color: Colors.grey[300],
        //product stack
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: 200,
                  color: Colors.grey[200],
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: IconButton(
                    icon: Icon(
                      widget.isfav[widget.index]
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 30,
                    ),
                    color:
                        widget.isfav[widget.index] ? Colors.red : Colors.black,
                    onPressed: () {
                      setState(() {
                        widget.isfav[widget.index] =
                            !widget.isfav[widget.index];
                      });
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Product Name',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'Product Price *',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
