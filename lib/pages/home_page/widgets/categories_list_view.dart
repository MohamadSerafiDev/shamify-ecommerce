import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:store/styles/assets.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
    required this.index,
  });

  final List<Map<String, dynamic>> cat = [
    {'name': 'shirts', 'image': AppImages.shirts},
    {'name': 'T-shirts', 'image': AppImages.tshirt},
    {'name': 'Hoodies', 'image': AppImages.hoodies},
    {'name': 'Bags', 'image': AppImages.bags},
    {'name': 'Shoes', 'image': AppImages.shoes},
    {'name': 'Accessories', 'image': AppImages.accessories},
    {'name': 'Gloves', 'image': AppImages.gloves},
  ];
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                //categories navigation
              },
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Image.asset(
                    cat[index]['image'],
                  ),
                ),
              ),
            ),
            const Gap(
              10,
            ),
            Text(cat[index]['name']),
          ],
        ),
        const Gap(
          13,
        )
      ],
    );
  }
}
