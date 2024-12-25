// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/pages/cart_page/widgets/name_and_desc.dart';
import 'package:store/pages/cart_page/widgets/price_n_counter.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Container(
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Constants.darkinsidecolor,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.parcel),
                ),
                SizedBox(
                  width: 10,
                ),
                NameAndDesc(),
                SizedBox(
                  width: 80,
                ),
                PriceNCounter()
              ],
            )),
      ),
    );
  }
}
