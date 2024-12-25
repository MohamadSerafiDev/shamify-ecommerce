import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetCart {
  String baseUrl = '${Constants.localip}/api/v1/get-cart';

  Future<CartModel> getCart() async {
    Map<String, dynamic> data = await Api().get(
      url: baseUrl,
    );

    return CartModel(quantity: data['quantity'], item: data['item']);
  }
}

class CartModel {
  final int quantity;
  final dynamic item;

  CartModel({required this.quantity, required this.item});
}
