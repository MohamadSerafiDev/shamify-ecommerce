import 'package:store/services/stores/get_specific_store_products.dart';

class OrderModel {
  final num id;
  final num totalprice;
  final String status; // 'pending' or 'fulfilled'
  final String orderedat;
  final String dileveredat;
  final List<ProductModel> products;

  OrderModel({
    required this.id,
    required this.totalprice,
    required this.status,
    required this.dileveredat,
    required this.orderedat,
    required this.products,
  });
}
