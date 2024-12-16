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
                  // navigation to cart
                },
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                ),
                child: const Icon(
                  CustomIcons.notification,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
