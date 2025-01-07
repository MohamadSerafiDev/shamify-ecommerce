import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:store/cubits/counter/counter_cubit.dart';
import 'package:store/cubits/fetch_cart/fetch_cart_cubit.dart';

import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class PriceNCounter extends StatelessWidget {
  PriceNCounter({
    super.key,
    required this.quantity,
    required this.price,
    required this.index,
    required this.storage,
  });
  final int storage;
  final int index;
  int quantity;
  final int price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Column(
          children: [
            const Gap(
              25,
            ),
            Text(
              '${price * quantity} \$',
              textAlign: TextAlign.start,
              style: TextStyles.textStyle18,
            ),
            const Gap(
              9,
            ),
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      if (quantity > 1) {
                        quantity--;
                        BlocProvider.of<FetchCartCubit>(context)
                            .orderList[index]['quantity'] = quantity.toString();
                        BlocProvider.of<CounterCubit>(context).decrement();
                      }
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Constants.buttoncolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        AppIcons.minus,
                        color: Theme.of(context).cardColor,
                        scale: 4,
                      ),
                    ),
                  ),
                  Text(
                    '$quantity',
                    style: TextStyles.textStyle14,
                  ),
                  InkWell(
                    onTap: () {
                      if (quantity < storage) {
                        quantity++;
                        BlocProvider.of<FetchCartCubit>(context)
                            .orderList[index]['quantity'] = quantity.toString();
                        BlocProvider.of<CounterCubit>(context).increment();
                      } else {
                        Get.snackbar(
                          'error',
                          'the items in the storage is just $storage you can\'t add more',
                        );
                      }
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Constants.buttoncolor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(
                        AppIcons.plus,
                        color: Theme.of(context).cardColor,
                        scale: 4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
