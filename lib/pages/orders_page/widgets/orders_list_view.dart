import 'package:flutter/material.dart';
import 'package:store/pages/orders_page/widgets/order_list_tile.dart';

class OrdersListView extends StatelessWidget {
  const OrdersListView({
    super.key,
    required this.data,
    required this.status,
    required this.icon,
  });
  final List data;
  final String status;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...data.where((order) => order.status == status).map((order) {
          return OrderListTile(order: order, end: icon);
        }),
      ],
    );
  }
}
