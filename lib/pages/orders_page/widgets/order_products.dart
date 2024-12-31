import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:store/cubits/favourite/favourite_cubit.dart';
import 'package:store/pages/global_widgets/grid_view_product_screen.dart';
import 'package:store/services/stores/get_specific_store_products.dart';

class OrderProducts extends StatelessWidget {
  const OrderProducts({super.key, required this.title, required this.data});
  final String title;
  final List<ProductModel> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridViewProductScreen(data: data),
      ),
    );
  }
}
