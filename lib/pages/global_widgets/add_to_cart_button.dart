// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/services/stores/get_specific_store_products.dart';
import 'package:store/styles/constants.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.data,
    required this.iconColor,
  });

  final ProductModel data;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (data.count > 0) {
          await Api().post(
              url:
                  '${Constants.localip}/api/v1/add-to-cart/${data.id.toString()}',
              body: jsonEncode({'quantity': '1'}),
              withToken: true);
          // create snackbar
          Get.snackbar(
            duration: const Duration(milliseconds: 1500),
            'Success',
            'Added to cart',
            snackPosition: SnackPosition.BOTTOM,
          );
        } else {
          Get.snackbar(
            duration: const Duration(seconds: 1),
            'Failed',
            'Not enoug products in stock',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      icon: Icon(
        Icons.add_shopping_cart_outlined,
        size: 30,
        color: iconColor,
      ),
    );
  }
}
