import 'package:flutter/material.dart';
import 'package:store/pages/global_widgets/add_to_cart_button.dart';
import 'package:store/pages/global_widgets/fav_button.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

class BottomRowButtons extends StatelessWidget {
  const BottomRowButtons({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              // vertical: 5,
            ),
            textStyle: const TextStyle(fontSize: 16),
          ),
          child: FavButton(data: product),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              // vertical: 5,
            ),
          ),
          child: AddToCartButton(
            data: product,
            iconColor: Theme.of(context).textTheme.bodyLarge!.color!,
          ),
        ),
      ],
    );
  }
}
