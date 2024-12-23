// ignore_for_file: prefer_const_constructors

import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:store/styles/constants.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      children: [
        ...List.generate(
          2,
          (index) {
            return Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 0)
                  : const EdgeInsets.only(left: 12),
              child: CardLoading(
                curve: Curves.slowMiddle,
                animationDuration: Duration(milliseconds: 1300),
                animationDurationTwo: Duration(milliseconds: 1300),
                cardLoadingTheme: CardLoadingTheme(
                  colorOne: Constants.darkbackgroundcolor.withOpacity(0.7),
                  colorTwo: Constants.darkinsidecolor,
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: 200,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            );
          },
        )
      ],
    );
  }
}
