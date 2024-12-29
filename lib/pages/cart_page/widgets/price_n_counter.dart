import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  });
  final int index;
  int quantity;
  final int price;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterCubit, CounterState>(
      builder: (context, state) {
        return Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              '${price * quantity} \$',
              textAlign: TextAlign.start,
              style: TextStyles.textStyle22,
            ),
            const SizedBox(
              height: 9,
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
                                    .orderList[index]['quantity'] =
                                quantity.toString();
                            BlocProvider.of<CounterCubit>(context).decrement();
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Constants.buttoncolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            AppIcons.minus,
                            color: Theme.of(context).cardColor,
                            scale: 3,
                          ),
                        ),
                      ),
                      Text(
                        '$quantity',
                        style: TextStyles.textStyle18,
                      ),
                      InkWell(
                        onTap: () {
                          quantity++;
                          BlocProvider.of<FetchCartCubit>(context)
                                  .orderList[index]['quantity'] =
                              quantity.toString();
                          BlocProvider.of<CounterCubit>(context).increment();
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: Constants.buttoncolor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            AppIcons.plus,
                            color: Theme.of(context).cardColor,
                            scale: 3,
                          ),
                        ),
                      ),
                    ])),
          ],
        );
      },
    );
  }
}
