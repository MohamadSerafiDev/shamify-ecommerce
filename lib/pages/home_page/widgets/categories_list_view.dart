import 'package:flutter/material.dart';

class CategoriesListView extends StatelessWidget {
  CategoriesListView({
    super.key,
    required this.index,
  });

  final List<Map<String, dynamic>> cat = [
    {'name': 'shirts', 'icon': Icons.numbers},
    {'name': 'T-shirts', 'icon': Icons.numbers},
    {'name': 'Hoodies', 'icon': Icons.numbers},
    {'name': 'Bags', 'icon': Icons.numbers},
    {'name': 'Shoes', 'icon': Icons.numbers},
    {'name': 'Accessories', 'icon': Icons.numbers},
    {'name': 'Gloves', 'icon': Icons.numbers},
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
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(50)),
                child: Center(child: Icon(cat[index]['icon'])),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(cat[index]['name']),
          ],
        ),
        const SizedBox(
          width: 13,
        )
      ],
    );
  }
}
