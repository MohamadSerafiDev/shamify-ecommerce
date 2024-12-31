import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/favorites_page/favorites_page.dart';
import 'package:store/styles/assets.dart';

class HomeFavoritesButton extends StatelessWidget {
  const HomeFavoritesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              // navigation to fav
              Get.to(() => const FavoritesPage());
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
    );
  }
}
