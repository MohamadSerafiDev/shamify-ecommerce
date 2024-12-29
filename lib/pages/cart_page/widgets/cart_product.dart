import 'package:flutter/material.dart';
import 'package:store/pages/cart_page/widgets/name_and_desc.dart';
import 'package:store/pages/cart_page/widgets/price_n_counter.dart';
import 'package:store/styles/assets.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({
    super.key,
    required this.state,
    required this.index,
  });
  final dynamic state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).cardColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(AppImages.parcel),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 80,
                child: NameAndDesc(
                  name: state.cart[index]['item']['name'],
                  desc: state.cart[index]['item']['description'],
                ),
              ),
              const SizedBox(
                width: 80,
              ),
              PriceNCounter(
                quantity: state.cart[index]['quantity'] is String
                    ? int.parse(state.cart[index]['quantity'])
                    : state.cart[index]['quantity'],
                price: state.cart[index]['price'],
                index: index,
              )
            ],
          )),
    );
  }
}
