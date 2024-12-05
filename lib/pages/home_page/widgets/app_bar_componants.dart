// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';

class AppBarComponants extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponants({super.key, required this.searchcontroller});
  final TextEditingController searchcontroller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        SizedBox(
          width: 20,
        ),
        SizedBox(
          width: 300,
          height: 50,
          child: TextFormField(
            controller: searchcontroller,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
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

  @override
  Size get preferredSize => Size.fromHeight(50);
}
