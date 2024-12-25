// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/counter/counter_cubit.dart';
import 'package:store/pages/cart_page/widgets/counter_row.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class PriceNCounter extends StatelessWidget {
  PriceNCounter({
    super.key,
  });
  int i = 9;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'price',
          textAlign: TextAlign.start,
          style: TextStyles.textStyle22,
        ),
        SizedBox(
          height: 9,
        ),
        SizedBox(
          width: 100,
          child: BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (i > 1) {
                          i--;
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
                          color: Constants.darkinsidecolor,
                          scale: 3,
                        ),
                      ),
                    ),
                    Text(
                      '$i',
                      style: TextStyles.textStyle18,
                    ),
                    InkWell(
                      onTap: () {
                        i++;
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
                          color: Constants.darkinsidecolor,
                          scale: 3,
                        ),
                      ),
                    ),
                  ]);
            },
          ),
        )
      ],
    );
  }
}
