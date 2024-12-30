// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/api/api.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';
import 'package:store/cubits/navigation/navigation_cubit.dart';
import 'package:store/pages/cart_page/widgets/check_out_bottom_sheet.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        //bottom sheet checkout info
        CheckOutBottomSheet(
          context,
          onTapOrder: () async {
            dynamic response = await Api().post(
                url: '${Constants.localip}/api/v1/purchase-products',
                body: jsonEncode(
                    BlocProvider.of<FetchCartCubit>(context).orderList),
                withToken: true);
            if (response['message'] == 'Order placed successfully') {
              Get.snackbar(
                'Success',
                'Order placed successfully',
                backgroundColor: Theme.of(context).cardColor,
                snackPosition: SnackPosition.TOP,
              );
              Navigator.pop(context);
              BlocProvider.of<FetchCartCubit>(context).orderPlaced();
              context.read<NavigationBarCubit>().selectTab(2);
            }
          },
        );
      },
      child: const Text(
        'Check Out >>',
        style: TextStyles.textStyle18,
      ),
    );
  }
}
