class OrderModel {
  final num id;
  final num totalprice;
  final String status; // 'pending' or 'fulfilled'

  final String orderedat;
  final String dileveredat;
  final List products;

  OrderModel({
    required this.id,
    required this.totalprice,
    required this.status,
    required this.dileveredat,
    required this.orderedat,
    required this.products,
  });
}
