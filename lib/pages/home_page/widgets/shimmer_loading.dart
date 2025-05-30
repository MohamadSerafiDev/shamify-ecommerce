import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

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
                animationDuration: const Duration(milliseconds: 1300),
                animationDurationTwo: const Duration(milliseconds: 1300),
                cardLoadingTheme: CardLoadingTheme(
                  colorOne: Theme.of(context)
                      .scaffoldBackgroundColor
                      .withOpacity(0.7),
                  colorTwo: Theme.of(context).cardColor,
                ),
                height: MediaQuery.of(context).size.height * 0.4,
                width: 200,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
            );
          },
        )
      ],
    );
  }
}
