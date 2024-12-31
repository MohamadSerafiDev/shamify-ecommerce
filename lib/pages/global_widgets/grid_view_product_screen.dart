import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/products_page/widgets/product_card.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

class GridViewProductScreen extends StatelessWidget {
  const GridViewProductScreen({
    super.key,
    required this.data,
  });

  final List<ProductModel> data;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.6 / 4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        BlocProvider.of<FavouriteCubit>(context)
            .isfav
            .add(data[index].isFavorite);
        return ProductCard(
          index: index,
          data: data[index],
        );
      },
    );
  }
}
