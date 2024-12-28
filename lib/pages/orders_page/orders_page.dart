// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store/api/api.dart';
import 'package:store/styles/assets.dart';
import 'package:store/styles/constants.dart';
import 'package:store/styles/text_styles.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});
  @override
  final List<Order> orders = [
    Order(
        id: '1',
        title: 'Order 1',
        status: 'pending',
        details: 'Details about Order 1'),
    Order(
        id: '2',
        title: 'Order 2',
        status: 'fulfilled',
        details: 'Details about Order 2'),
    Order(
        id: '3',
        title: 'Order 3',
        status: 'pending',
        details: 'Details about Order 3'),
    Order(
        id: '4',
        title: 'Order 4',
        status: 'fulfilled',
        details: 'Details about Order 4'),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Pending Orders',
            style: TextStyles.textStyle18,
          ),
        ),
        ...orders
            .where((order) => order.status == 'pending')
            .map((order) => ListTile(
                  title: Text(order.title),
                  subtitle: Text(order.details),
                  trailing: SizedBox(
                    height: 20,
                    width: 20,
                    child: SpinKitPouringHourGlass(
                      color: Constants.buttoncolor,
                      strokeWidth: 0.5,
                      size: 30,
                    ),
                  ),
                )),
        Divider(
          indent: 30,
          endIndent: 30,
          color: Colors.white,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Fulfilled Orders',
            style: TextStyles.textStyle18,
          ),
        ),
        ...orders.where((order) => order.status == 'fulfilled').map(
              (order) => ListTile(
                title: Text(order.title),
                subtitle: Text(order.details),
                trailing: Image.asset(
                  AppIcons.truesing,
                  color: Constants.buttoncolor,
                  width: 25,
                ),
              ),
            ),
      ],
    );
  }
}

class Order {
  final String id;
  final String title;
  final String status; // 'pending' or 'fulfilled'
  final String details;

  Order(
      {required this.id,
      required this.title,
      required this.status,
      required this.details});
}
