// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/services/stores/get_store_data.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () async {
            Map data = await GetStoreData().getData(id: 1);
            print(data);
          },
          child: Text('Orders'),
        ),
      ),
    );
  }
}
