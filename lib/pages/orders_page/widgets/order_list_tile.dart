import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/models/order_model.dart';
import 'package:store/pages/orders_page/widgets/order_products.dart';

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
      onTap: () {
        Get.to(() => OrderProducts(
              title: 'order ${order.id}',
              data: order.products,
            ));
      },
      title: Text('order ${order.id}'),
      subtitle: Text('\$${order.totalprice}'),
      trailing: SizedBox(height: 20, width: 20, child: end),
    );
  }
}
