import 'package:flutter/material.dart';
import 'package:store/pages/store_products_page/widgets/product_card.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

class GridViewProductScreen extends StatelessWidget {
  const GridViewProductScreen({
    super.key,
    required this.data,
  });

  final List<ProductModel> data;
  // convert data to stream

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.13,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ProductCard(
          index: index,
          data: data[index],
        );
      },
    );
  }
}
