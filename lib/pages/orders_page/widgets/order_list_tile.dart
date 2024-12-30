import 'package:flutter/material.dart';
import 'package:store/services/orders/get_orders.dart';

class OrderListTile extends StatelessWidget {
  const OrderListTile({
    super.key,
    required this.order,
    required this.end,
  });
  final OrderModel order;
  final Widget end;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text('order ${order.id}'),
      subtitle: Text('\$${order.totalprice}'),
      trailing: SizedBox(height: 20, width: 20, child: end),
    );
  }
}
