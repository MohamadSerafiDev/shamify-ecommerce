// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/services/stores/get_all_stores.dart';
import 'package:store/services/stores/get_store_data.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () async {
            dynamic data = await GetAllStores().getStores();
            print(data);
          },
          child: Text('Orders'),
        ),
      ),
    );
  }
}
