// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';

class ProductsAppBar extends StatelessWidget {
  const ProductsAppBar({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          InkWell(
              splashColor: Colors.transparent,
              radius: 30,
              onTap: () {
                Get.back();
                BlocProvider.of<FavouriteCubit>(context).isfav = [];
              },
              child: Stack(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Constants.darkinsidecolor,
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  Positioned(
                    left: 8,
                    top: 4,
                    child: Image.asset(
                      AppIcons.left,
                      color: Colors.white,
                      width: 15,
                    ),
                  )
                ],
              )),
          Spacer(),
          Text(
            '$title Products',
            style: TextStyle(fontSize: 22),
          ),
          Spacer(
            flex: 4,
          )
        ],
      ),
    );
  }
}
