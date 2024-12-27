// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/pages/search_page/search_page.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class AppBarComponants extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponants({super.key, required this.searchcontroller});
  final TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constants.darkbackgroundcolor,
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            controller: searchcontroller,
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
              Get.to(SearchPage(), arguments: value);
              print(value);
              print(searchcontroller.text);
              searchcontroller.clear();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SizedBox(
            height: 45,
            child: ElevatedButton(
                onPressed: () {
                  // navigation to fav
                  Get.to(FavoritesPage());
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
