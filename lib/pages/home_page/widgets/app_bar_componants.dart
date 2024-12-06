// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:store/custom_icons.dart';
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
          width: 30,
        ),
        SizedBox(
          width: 320,
          height: 50,
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
              searchcontroller.clear();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    // navigation to cart
                  },
                  child: Icon(
                    CustomIcons.notification,
                    size: 15,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}
