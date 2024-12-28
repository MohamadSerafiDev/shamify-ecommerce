import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class GetCart {
  String baseUrl = '${Constants.localip}/api/v1/get-cart';

  Future<dynamic> getCart() async {
    Map<String, dynamic> data = await Api().get(
      url: baseUrl,
    );
    // for (var element in data['cart']['items']) {
    //   print(element['quantity']);
    // }
    // print(data['cart']['items'][0]['quantity']);
    // print(data['items'][0]['item']);

    return data['cart'];
  }
}

// class CartModel {
//   final int quantity;
//   final dynamic item;

//   CartModel({required this.quantity, required this.item});
// }
