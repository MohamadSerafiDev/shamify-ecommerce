import 'package:store/api/api.dart';
import 'package:store/styles/constants.dart';

class DeleteFromCart {
  String baseUrl = '${Constants.localip}/api/v1/delete-cart-product';

  Future<dynamic> delete(int id) async {
    Map<String, dynamic> data = await Api().delete(
      url: '$baseUrl/$id',
    );
    return data;
  }
}
