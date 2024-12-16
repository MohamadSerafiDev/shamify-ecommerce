import 'package:flutter/material.dart';
import 'package:store/styles/constants.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
    required this.cat,
    required this.index,
  });

  final List<Map<String, dynamic>> cat;
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
                    color: Constants.darkinsidecolor,
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
