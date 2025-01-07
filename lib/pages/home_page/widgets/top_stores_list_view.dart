import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/pages/store_products_page/products_page.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/text_styles.dart';

class TopStoresListView extends StatelessWidget {
  TopStoresListView({super.key, required this.index, required this.data});
  final List<bool> isfav = List.generate(20, (index) => false);
  final int index;
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0
          ? const EdgeInsets.only(left: 0)
          : const EdgeInsets.only(left: 10),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          Get.to(
            () => ProductsPage(
              title: data[index]['name'],
              id: data[index]['id'],
            ),
          );
        },
        child: Card(
          color: Theme.of(context).cardColor,
          //product stack
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: 190,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 25,
                    child: Image.asset(
                      AppImages.checkout,
                      width: 150,
                    ),
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Text(
                  data[index]['name'],
                  style: TextStyles.textStyle18
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: SizedBox(
                  width: 130,
                  child: Text(
                    data[index]['description'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyles.textStyle14.copyWith(
                      color: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .color!
                          .withOpacity(0.65),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
