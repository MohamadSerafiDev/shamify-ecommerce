// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:store/api/api.dart';
import 'package:store/services/search/search_for_products_and_stores.dart';
import 'package:store/shared_preferences/session_manage.dart';
import 'package:store/styles/constants.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
          onPressed: () async {
            dynamic data =
                await Api().get(url: '${Constants.localip}/api/v1/get-cart');
            // print(await SessionManage().getSessionId());
            print(data);
            // print(data.stores);
          },
          child: Text('Orders'),
        ),
      ),
    );
  }
}
