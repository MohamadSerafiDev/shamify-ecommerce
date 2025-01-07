import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class AddFavToCartFloatingButton extends StatelessWidget {
  const AddFavToCartFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: FloatingActionButton(
        backgroundColor: Constants.buttoncolor,
        onPressed: () async {
          dynamic response = await Api().post(
            url: '${Constants.localip}/api/v1/add-all-to-cart',
            withToken: true,
          );
          if (response['message'] == "good") {
            Get.snackbar(
              duration: const Duration(seconds: 1),
              'Success',
              'All favorites added to cart',
              backgroundColor: Theme.of(context).cardColor,
              snackPosition: SnackPosition.TOP,
            );
          }
        },
        child: Text(
          'add Favorites to your Cart +',
          style: TextStyles.textStyle18.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
