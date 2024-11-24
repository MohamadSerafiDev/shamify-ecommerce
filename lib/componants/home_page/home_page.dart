// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';

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
        extendBody: true,
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
          onTap: (p0) {
            setState(() {
              index = p0;
            });
          },
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            //top search
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.grey[300],
                    ),
                    onFieldSubmitted: (value) {
                      //search backend
                    },
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  MaterialButton(
                    onPressed: () {
                      // navigation to cart
                    },
                    child: Icon(
                      Icons.shopping_cart_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                    color: Color.fromRGBO(142, 108, 239, 1),
                    height: 45,
                    minWidth: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                  Text(
                    "See All",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            //buttons row
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 15),
                  children: [
                    ...List.generate(
                      7,
                      (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 75,
                                width: 75,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(50)),
                                child: Center(child: Icon(cat[index]['icon'])),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(cat[index]['name'])
                            ],
                          ),
                        );
                      },
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
