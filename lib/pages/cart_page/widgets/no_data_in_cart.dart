import 'package:flutter/material.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class NoDataInCart extends StatelessWidget {
  const NoDataInCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppImages.parcel,
            width: 200,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'No data in your Cart',
            style: TextStyles.textStyle18,
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
