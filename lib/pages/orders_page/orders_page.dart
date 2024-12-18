// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:store/services/get_all_products.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () async {
            List data = await GetAllProducts().getProducts();
            print(data);
          },
          child: Text('Orders'),
        ),
      ),
    );
  }
}
